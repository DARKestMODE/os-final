package com.example.OSfinal;

import com.example.OSfinal.algorithms.Clock;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ClockServlet", value = "/clockServlet")
public class ClockServlet extends HttpServlet {
    private Clock clock = new Clock();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("accessSequence", clock.getAccessSequence());
        request.setAttribute("labels", clock.getLabels());
        request.setAttribute("buffer", clock.getBuffer());
        request.setAttribute("index", Clock.getIndex());
        request.setAttribute("clockIndex", Clock.getClockIndex());
        request.getRequestDispatcher("/clock.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (clock.getAccessSequence().size() == Clock.getIndex()) {
            clock.setAccessSequence();
            Clock.setIndex();
            request.setAttribute("accessSequence", clock.getAccessSequence());
        } else {
            clock.algorithm();
        }
        response.getWriter().write("True");
    }
}

