##
## EPITECH PROJECT, 2018
## Tetris
## File description:
## Makefile
##

CC			=	gcc

CFLAGS		=	-Wall					\
				-Wextra

MAIN		=	src/main.c

SRC			=	src/test.c

MAINOBJ		=	$(MAIN:.c=.o)

SRCOBJ		=	$(SRC:.c=.o)

TEST		=	tests/tests_basics.c

TESTOBJ		=	$(TEST:.c=.o)

CRITERION	=	-l criterion

CPPFLAGS	=	-I ./include/

LIBPATH		=	./lib/

LIB			=	-L $(LIBPATH) -l array

NAME		=	test_bin

TESTNAME	=	unit_tests

all: $(NAME)

$(LIB):
	 cd $(LIBPATH) && $(MAKE)

$(NAME): $(SRCOBJ) $(MAINOBJ)
	$(CC) -o $(NAME) $(MAINOBJ) $(SRCOBJ) $(CPPFLAGS) $(CFLAGS)

debug: CFLAGS += -g3
debug: clean $(SRCOBJ) $(MAINOBJ)
	$(CC) -o $(NAME) $(MAINOBJ) $(SRCOBJ) $(CPPFLAGS) $(CFLAGS)

tests_run: CFLAGS += --coverage
tests_run: fclean $(SRCOBJ) $(TESTOBJ)
	$(CC) -o $(TESTNAME) $(SRCOBJ) $(TESTOBJ) $(CPPFLAGS) $(CRITERION) $(CFLAGS)
	./$(TESTNAME)
	gcovr -b -e tests/

clean:
	$(RM) $(TESTOBJ)
	$(RM) $(SRCOBJ)
	$(RM) $(MAINOBJ)
	$(RM) $(TEST:.c=.gcno)
	$(RM) $(TEST:.c=.gcda)
	$(RM) $(SRC:.c=.gcno)
	$(RM) $(SRC:.c=.gcda)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(TESTNAME)

re: fclean all

.PHONY:	all clean fclean re
