package com.iss.irs;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

/**

 * Servlet implementation class SimpleServlet

 */

@WebServlet("/hello")

public class SampleServlet extends HttpServlet {

   private static final long serialVersionUID = 1L;

   @Override

   protected void doGet(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {

      resp.setContentType("text/plain");

      resp.getWriter().write("Hello World! Maven Web Project Example.");
      
      OkHttpClient client = new OkHttpClient();

      Request request = new Request.Builder()
        .url("http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers")
        .get()
        .addHeader("X-KIE-ContentType", "xstream")
        .addHeader("contentType", "application/xml")
        .addHeader("Authorization", "Basic d2JhZG1pbjp3YmFkbWlu")
        .addHeader("cache-control", "no-cache")
        .addHeader("Postman-Token", "603ae13f-1eee-4bb1-86d4-e19dc67b15d5")
        .build();

       Response response = client.newCall(request).execute();
       System.out.println("response" + response.body());
       
       InputStream is = response.body().byteStream();
       
             
       System.out.println("response body to string" +response.body().toString());

   }

}