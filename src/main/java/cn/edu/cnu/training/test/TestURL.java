package cn.edu.cnu.training.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class TestURL {
	public static void main(String[] args) throws IOException {
		String url = "http://localhost:8080/training/user/login";
		PrintWriter out = null;
		try {
			URL url2 = new URL(url);
			
			
			URLConnection connection = url2.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            
            connection.setDoOutput(true);
            connection.setDoInput(true);
            
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(connection.getOutputStream());
            // 发送请求参数
            String param = "{\"userId\":\"1\",\"name\":\"menglll\",\"password\":\"000000\"}";
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            
            // 建立实际的连接
            connection.connect();
			
			InputStreamReader isr = new InputStreamReader(connection.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			String str;
			while ((str = br.readLine()) != null) {
				System.out.println(str);
			}

			br.close();
			isr.close();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
