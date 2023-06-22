from typing import *
import itertools


def main():
    N, M = map(int, input().split())
    A: List[int] = list(map(int, input().split()))

    C: List[int] = [0] + list(itertools.accumulate(A))
    D: List[int] = [0] + list(itertools.accumulate([(i + 1) * a for i, a in enumerate(A)]))
    print([(i + 1) * a for i, a in enumerate(A)])
    answer: int = -(1 << 60)
    print(answer)
    for k in range(N - M + 1):
        X: int = D[k + M] - D[k]
        Y: int = k * (C[k + M] - C[k])
        answer = max(answer, X - Y)
    print(answer)
    print(N)
    print(M)
    print(A)
    print(C)
    print(D)


def banned_k():
    N = 2e5 + 8



if __name__ == '__main__':
    main()
