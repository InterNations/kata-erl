NAME = kata

APP_SRC = $(wildcard src/*erl)
APP_OBJ_LIST = $(APP_SRC:%.erl=%.beam)
APP_OUT = out/production
APP_OBJ = $(APP_OBJ_LIST:src%=$(APP_OUT)%)
APP_ERLC_FLAGS = -o $(APP_OUT)

TEST_OUT = out/test
TEST_OBJ = $(APP_OBJ_LIST:src%=$(TEST_OUT)%)
TEST_ERLC_FLAGS = -o $(TEST_OUT) -DTEST
TEST_OPTS = -s kata test

ERLC = erlc

.PHONY: all kata

all: kata

kata: $(APP_OBJ)

out/production/%.beam: src/%.erl
	$(ERLC) $(APP_ERLC_FLAGS) $<

out/test/%.beam: src/%.erl
	$(ERLC) $(TEST_ERLC_FLAGS) $<

test: $(TEST_OBJ)
	erl -pa $(TEST_OUT) -noshell $(TEST_OPTS) -s init stop

clean:
	rm -f $(TEST_OUT)/* $(APP_OUT)/*
