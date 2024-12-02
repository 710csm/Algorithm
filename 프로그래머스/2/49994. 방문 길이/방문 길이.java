class Solution {
    public static int solution(String dirs) {
        int answer = 0;
        int x = 5;
        int y = 5;
        boolean flag[][][][] = new boolean[11][11][11][11];

        for(int i=0; i<dirs.length(); i++){
            int nextX = x;
            int nextY = y;

            switch (dirs.charAt(i)) {
                case 'U' -> {
                    nextY++;
                    if(nextY > 10) {
                        nextY--;
                        continue;
                    }
                }
                case 'D' -> {
                    nextY--;
                    if(nextY < 0) {
                        nextY++;
                        continue;
                    }
                }
                case 'L' -> {
                    nextX--;
                    if(nextX < 0) {
                        nextX++;
                        continue;
                    }
                }
                case 'R' -> {
                    nextX++;
                    if(nextX > 10) {
                        nextX--;
                        continue;
                    }
                }

            }
            if (!flag[nextY][nextX][y][x]) {
                flag[nextY][nextX][y][x] = true;
                flag[y][x][nextY][nextX] = true;
                answer++;
            }
            x = nextX;
            y = nextY;
        }

        return answer;
    }
}