# Assignment 2

## 1. Multi-Threaded Task Runner 

``` #include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>

// Shared input N
int N;

// Function to check if a number is prime
bool is_prime(int num) {
    if (num < 2) return false;
    for (int i = 2; i * i <= num; i++)
        if (num % i == 0) return false;
    return true;
}

// Thread A: Compute sum of first N prime numbers
void* sum_of_primes(void* arg) {
    int count = 0, num = 2, sum = 0;

    while (count < N) {
        if (is_prime(num)) {
            sum += num;
            count++;
        }
        num++;
    }

    printf("Thread A: Sum of first %d prime numbers is %d\n", N, sum);
    pthread_exit(NULL);
}

// Thread B: Print every 2 seconds for 100 seconds
void* thread1(void* arg) {
    for (int t = 0; t <= 100; t += 2) {
        printf("Thread 1 running\n");
        sleep(2);
    }
    pthread_exit(NULL);
}

// Thread C: Print every 3 seconds for 100 seconds
void* thread2(void* arg) {
    for (int t = 0; t <= 100; t += 3) {
        printf("Thread 2 running\n");
        sleep(3);
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t tidA, tidB, tidC;

    printf("Enter N (number of prime numbers to sum): ");
    scanf("%d", &N);

    // Create the threads
    pthread_create(&tidA, NULL, sum_of_primes, NULL);
    pthread_create(&tidB, NULL, thread1, NULL);
    pthread_create(&tidC, NULL, thread2, NULL);

    // Wait for all threads to finish
    pthread_join(tidA, NULL);
    pthread_join(tidB, NULL);
    pthread_join(tidC, NULL);

    printf("All threads finished.\n");
    return 0;
} ```

2. Signal-Handled & Timed Threads

```
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>
#include <signal.h>
#include <time.h>

// Global input for Thread A
int N;

// Handle Ctrl+C (SIGINT)
void sigint_handler(int sig) {
    printf("\nSIGINT caught. Ignoring termination.\n");
}

// Check if a number is prime
bool is_prime(int num) {
    if (num < 2) return false;
    for (int i = 2; i * i <= num; ++i)
        if (num % i == 0) return false;
    return true;
}

// Timing helper
double get_time_diff(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
}

// Thread A: Sum of first N prime numbers
void* thread_sum_primes(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread A started.\n");

    int count = 0, num = 2, sum = 0;
    while (count < N) {
        if (is_prime(num)) {
            sum += num;
            count++;
        }
        num++;
    }

    printf("Thread A: Sum of first %d prime numbers = %d\n", N, sum);

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread A finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

// Thread B: Prints every 2 seconds
void* thread_print_2s(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread B started.\n");

    for (int t = 0; t <= 100; t += 2) {
        printf("Thread 1 running\n");
        sleep(2);
    }

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread B finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

// Thread C: Prints every 3 seconds
void* thread_print_3s(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread C started.\n");

    for (int t = 0; t <= 100; t += 3) {
        printf("Thread 2 running\n");
        sleep(3);
    }

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread C finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

int main() {
    pthread_t tidA, tidB, tidC;

    // Register signal handler
    signal(SIGINT, sigint_handler);

    printf("Enter N (number of primes to sum): ");
    scanf("%d", &N);

    printf("Starting all threads...\n");

    // Create threads
    pthread_create(&tidA, NULL, thread_sum_primes, NULL);
    pthread_create(&tidB, NULL, thread_print_2s, NULL);
    pthread_create(&tidC, NULL, thread_print_3s, NULL);

    // Wait for threads to finish
    pthread_join(tidA, NULL);
    pthread_join(tidB, NULL);
    pthread_join(tidC, NULL);

    printf("All threads completed.\n");
    return 0;
}
```

3. Process handling

```
1. Child Process – fork()

Understanding:

* fork() is a system call in UNIX/Linux used to create a new process, called a child process, which is a copy of the parent.
* After fork(), two processes exist with different process IDs.
* Return values:

  * 0 in the child process.
  * PID of the child in the parent.
  * -1 on error (e.g., if system resources are exhausted).

Example:


pid_t pid = fork();
if (pid == 0) {
    // Child process
} else if (pid > 0) {
    // Parent process
}

2. Handling Common Signals

Understanding:

Signals are software interrupts used by the OS to notify a process of events (e.g., errors, user actions).

Common Signals:

* SIGINT – interrupt (Ctrl+C)
* SIGTERM – termination request
* SIGKILL – force kill (non-catchable)
* SIGSEGV – segmentation fault (invalid memory access)
* SIGALRM – timer expiration

Example Handler:

#include <signal.h>
void sigint_handler(int sig) {
    printf("Caught SIGINT. Ignoring Ctrl+C.\n");
}
signal(SIGINT, sigint_handler);

3. Exploring Different Kernel Crashes

Understanding:

A kernel crash occurs when the OS kernel hits a fatal error and can no longer continue.

Common Causes:

* Null pointer dereference in kernel space.
* Stack overflows.
* Invalid memory access by drivers.
* Race conditions in kernel modules.

Exploration Tools:

* dmesg – to read kernel logs.
* journalctl – for system logs in systemd-based distros.
* Kernel crash dump analysis (kdump, crash tool).

4. Time Complexity

Understanding:

Time complexity is a measure of how an algorithm's execution time grows with input size.

Common Complexities:

* Constant: O(1)
* Linear: O(n)
* Logarithmic: O(log n)
* Quadratic: O(n^2)
* Exponential: O(2^n)

Example:

* Binary Search: O(log n)
* Bubble Sort: O(n^2)
* Merge Sort: O(n log n)

5. Locking Mechanism – Mutex / Spinlock

Understanding:

Used to protect critical sections in concurrent programming.

Mutex (Mutual Exclusion):

  * Sleeping lock.
  * Thread/process sleeps if the lock is held.
  * Suitable for user-space and blocking operations.

Spinlock:

  * Busy-waiting lock.
  * Keeps checking until lock is available.
  * Suitable for short, fast kernel operations (no sleeping).

Example (pthread mutex):

pthread_mutex_t lock;
pthread_mutex_lock(&lock);
// critical section
pthread_mutex_unlock(&lock);
```
