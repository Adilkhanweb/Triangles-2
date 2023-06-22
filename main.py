import numpy as np


#   https://machinelearningmastery.ru/linear-algebra-essentials-with-numpy-part-1-af4a867ac5ca/
def main():
    v = np.array([1, 1])
    u = np.array([2, 1])
    print(angle_between(v, u))


def angle_between(v1, v2):
    dot_pr = v1.dot(v2)
    norms = np.linalg.norm(v1) * np.linalg.norm(v2)

    return np.rad2deg(np.arccos(dot_pr / norms))


if __name__ == '__main__':
    main()
