package com.famgy.firstjavaweb.workstation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

@WebServlet(name = "DownloadServlet", urlPatterns = {"/download"}, loadOnStartup = 1)
public class DownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = this.getServletContext().getRealPath("./WEB-INF/fileUpload");
        String fileName = request.getParameter("filename");
        String fileFullPath = filePath + "/" + fileName;

        File file = new File(fileFullPath);
        if (!file.exists()) {
//            request.setAttribute("message", "您要下载的资源已被删除！");
//            request.getRequestDispatcher("/message.jsp").forward(request,response);
            return;
        }

        //设置响应头，控制浏览器下载该文件
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));

        //读取要下载的文件，保存到文件输入流
        FileInputStream in = new FileInputStream(fileFullPath);

        //创建输出流
        OutputStream out = response.getOutputStream();

        //创建缓冲区,循环将输入流中的内容读取到缓冲区当中
        byte buffer[] = new byte[1024];
        int len = 0;

        while((len=in.read(buffer))>0){
            //输出缓冲区的内容到浏览器，实现文件下载
            out.write(buffer, 0, len);
        }

        //关闭文件输入流
        in.close();

        //关闭输出流
        out.close();
    }
}
