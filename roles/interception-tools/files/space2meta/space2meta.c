#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>
#include <linux/input.h>

// clang-format off
const struct input_event
space_down = {.type = EV_KEY, .code = KEY_SPACE,    .value = 1},
meta_down  = {.type = EV_KEY, .code = KEY_LEFTMETA, .value = 1},
syn        = {.type = EV_SYN, .code = SYN_REPORT,   .value = 0};
// clang-format on

void print_usage(FILE *stream, const char *program) {
    // clang-format off
    fprintf(stream,
            "space2meta - turn space into meta when chorded to another key (on release)\n"
            "\n"
            "usage: %s [-h | -t delay]\n"
            "\n"
            "options:\n"
            "    -h show this message and exit\n"
            "    -t delay used for key sequences (default: 20000 microseconds)\n",
            program);
    // clang-format on
}

int read_event(struct input_event *event) {
    return fread(event, sizeof(struct input_event), 1, stdin) == 1;
}

void write_event(const struct input_event *event) {
    if (fwrite(event, sizeof(struct input_event), 1, stdout) != 1)
        exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]) {
    int delay = 20000;

    for (int opt; (opt = getopt(argc, argv, "ht:")) != -1;) {
        switch (opt) {
            case 'h':
                return print_usage(stdout, argv[0]), EXIT_SUCCESS;
            case 't':
                delay = atoi(optarg);
                continue;
        }

        return print_usage(stderr, argv[0]), EXIT_FAILURE;
    }

    struct input_event input, key_held;
    enum { START, SPACE_HELD, KEY_HELD, SPACE_IS_META } state = START;

    setbuf(stdin, NULL), setbuf(stdout, NULL);

    while (read_event(&input)) {
        if (input.type == EV_MSC && input.code == MSC_SCAN)
            continue;

        if (input.type != EV_KEY && input.type != EV_REL &&
            input.type != EV_ABS) {
            write_event(&input);
            continue;
        }

        switch (state) {
            case START:
                if (input.type == EV_KEY && input.code == KEY_SPACE &&
                    input.value)
                    state = SPACE_HELD;
                else
                    write_event(&input);
                break;
            case SPACE_HELD:
                if (input.type == EV_KEY && input.code == KEY_SPACE &&
                    input.value)
                    break;
                if (input.type == EV_KEY) {
                    if (input.value == 1) {
                        key_held = input;
                        state    = KEY_HELD;
                    } else {
                        write_event(&space_down);
                        write_event(&syn);
                        usleep(delay);
                        write_event(&input);
                        state = START;
                    }
                } else {
                    write_event(&meta_down);
                    write_event(&syn);
                    usleep(delay);
                    write_event(&input);
                    state = SPACE_IS_META;
                }
                break;
            case KEY_HELD:
                if (input.type == EV_KEY &&
                    (input.code == KEY_SPACE || input.code == key_held.code) &&
                    input.value)
                    break;
                if (input.type == EV_KEY && input.code == KEY_SPACE) {
                    write_event(&space_down);
                    state = START;
                } else {
                    write_event(&meta_down);
                    state = SPACE_IS_META;
                }
                write_event(&syn);
                usleep(delay);
                write_event(&key_held);
                write_event(&syn);
                usleep(delay);
                write_event(&input);
                break;
            case SPACE_IS_META:
                if (input.type == EV_KEY && input.code == KEY_SPACE) {
                    input.code = KEY_LEFTMETA;
                    if (input.value == 0)
                        state = START;
                }
                write_event(&input);
                break;
        }
    }
}
