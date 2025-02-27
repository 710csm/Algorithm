import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main {

    static StringBuilder sb;
    static int[] value;
    static int[] result;
    static boolean[] visit;
    static int N;
    static final int M = 6;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        while (true) {
            String[] input = br.readLine().split(" ");
            N = Integer.parseInt(input[0]);
            sb = new StringBuilder();

            if (N == 0) {
                break;
            }

            result = new int[N];
            value = new int[N];
            visit = new boolean[N];

            for (int i=1; i<=N; i++) {
                value[i-1] = Integer.parseInt(input[i]);
            }

            backTracking(0,0);

            System.out.println(sb);
        }
    }

    public static void backTracking(int at, int k) {
        if (k == M) {
            for (int i=0; i<M; i++) {
                sb.append(result[i]).append(" ");
            }
            sb.append("\n");
            return;
        }

        for (int i=at; i<N; i++) {
            if (!visit[i]) {
                visit[i] = true;
                result[k] = value[i];
                backTracking(i,k+1);
                visit[i] = false;
            }
        }
    }
}
