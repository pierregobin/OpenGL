CC=nvcc
COPTS=-O2

all : vector_add_c vector_add_cu

run : all
	./time vector_add_c
	./time vector_add_cu

clean:
	rm -rf vector_add_c vector_add_cu hello

vector_add_c : vector_add.c
	$(CC) $(COPTS) -o $@ $^

vector_add_cu : vector_add.cu
	$(CC) $(COPTS) -o $@ $^

hello : hello.cu
	$(CC) -o $@ $^
