import math


def main():
    with open('INPUT.TXT', 'r') as f:
        x = []
        y = []
        n = int(f.readline().strip())
        l = [[0 for i in range(5)] for j in range(n)]
        for i in range(n):  # Fill x and y
            a = []
            b = []
            line = f.readline().strip().split(' ')
            a.append(int(line[0]))
            a.append(int(line[2]))
            a.append(int(line[4]))
            b.append(int(line[1]))
            b.append(int(line[3]))
            b.append(int(line[5]))
            x.append(a)
            y.append(b)

        for i in range(n):
            s = (x[i][1] - x[i][0]) * (y[i][2] - y[i][0]) - \
                (x[i][2] - x[i][0]) * (y[i][1] - y[i][0])
            assert s != 0
            if s < 0:
                tmp = x[i][1]
                x[i][1] = x[i][2]
                x[i][2] = tmp

                tmp = y[i][1]
                y[i][1] = y[i][2]
                y[i][2] = tmp

            # Length or distance between two points
            # dist = sqrt( (x2 - x1)**2 + (y2 - y1)**2 )
            l[i][0] = int(math.pow(int(x[i][0] - x[i][1]), 2) +
                          math.pow(int(y[i][0] - y[i][1]), 2))
            l[i][1] = int(math.pow(int(x[i][1] - x[i][2]), 2) +
                          math.pow(int(y[i][1] - y[i][2]), 2))
            l[i][2] = int(math.pow(int(x[i][2] - x[i][0]), 2) +
                          math.pow(int(y[i][2] - y[i][0]), 2))
            l[i][3] = l[i][0]
            l[i][4] = l[i][1]

        with open('OUTPUT.TXT', 'w+') as f:
            f.writelines(check(l, n))


def check(l, n):
    for i in range(1, n):
        outer = False
        for j in range(3):
            if (l[i][0] == l[0][j]) and (l[i][1] == l[0][1 + j]) and (l[i][2] == l[0][2 + j]):
                outer = True
                break
        if outer:
            continue
        return "NO"
    return "YES"


if __name__ == '__main__':
    main()
