CC = gcc
#Using -Ofast instead of -O3 might result in faster code, but is supported only by newer GCC versions
CFLAGS = -lm -pthread -O3 -march=native -Wall -funroll-loops -Wno-unused-result
TARGET_PATH = bin/
all: word2vec word2phrase distance word-analogy compute-accuracy

word2vec : word2vec.c
	$(CC) word2vec.c -o $(TARGET_PATH)word2vec $(CFLAGS)
word2phrase : word2phrase.c
	$(CC) word2phrase.c -o $(TARGET_PATH)word2phrase $(CFLAGS)
distance : distance.c
	$(CC) distance.c -o $(TARGET_PATH)distance $(CFLAGS)
word-analogy : word-analogy.c
	$(CC) word-analogy.c -o $(TARGET_PATH)word-analogy $(CFLAGS)
compute-accuracy : compute-accuracy.c
	$(CC) compute-accuracy.c -o $(TARGET_PATH)compute-accuracy $(CFLAGS)
	chmod +x *.sh

clean:
	mkdir -p bin
	rm -rf bin/*
	# rm -rf word2vec word2phrase distance word-analogy compute-accuracy