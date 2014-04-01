#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void usage(void)
{
	fprintf(stderr, "cf-delay delay command\n");
	fprintf(stderr, "  delay: in second\n");
	fprintf(stderr, "  string: used by sh -c\n");
}

int main(int argc, char *argv[])
{
	int delay;
	if (argc != 3) {
		usage();
		exit(1);
	}
	if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) {
		usage();
		exit(0);
	}
	delay = atoi(argv[1]);
	if (delay == 0) {
		usage();
		exit(1);
	}

	int ret = daemon(0, 0);
	if (ret == 0) {
		sleep(delay);
		ret = execl("/system/bin/sh", "sh", "-c", argv[2], NULL);
		perror(NULL);
	}
	return 1;
}
