package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;

@WebServlet("/quartzServlet")
public class quartzServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SchedulerFactory sf = null;
	Scheduler sched = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("!");
		String name = request.getParameter("name");
		if(name.equals("plus")) {
			SchedulerFactory sf = new org.quartz.impl.StdSchedulerFactory();
			Scheduler sched;
			try {
				sched = sf.getScheduler();
			JobDetail job = JobBuilder.newJob(MyJob.class)
						.withIdentity("myjob", "group1")
						.build();
			
			Trigger trigger = TriggerBuilder.newTrigger()
						.withIdentity("myTrigger", "group1")
						.startNow()
						.withSchedule(SimpleScheduleBuilder.simpleSchedule()
								.withIntervalInSeconds(3)	// 3초 마다
								.repeatForever())
						.build();
			sched.scheduleJob(job, trigger);
			sched.start();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				sched.shutdown();
			} catch (SchedulerException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
