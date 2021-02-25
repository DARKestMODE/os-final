package com.example.OSfinal;

import com.example.OSfinal.algorithms.BestFit;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BestFitServlet", value = "/bestFitServlet")
public class BestFitServlet extends HttpServlet {
    private BestFit bestFit = new BestFit();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("processes", bestFit.getProcesses());
        request.getRequestDispatcher("/").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("next")) {
            int blockSize = Integer.parseInt(request.getParameter("block"));
            if (bestFit.algorithm(blockSize) != null) {
                bestFit.getProcesses().get(bestFit.algorithm(blockSize)).add(blockSize);
                response.getWriter().write("True");
            } else {
                response.getWriter().write("False");
            }
        }
        if (action.equals("reset")) {
            bestFit.resetProcesses();
            response.getWriter().write("True");
        }

    }
}
