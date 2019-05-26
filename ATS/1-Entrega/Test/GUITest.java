package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class GUITest {

    @Test
    public void addClient() {
        GUI gui = new GUI();
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);

        Boolean t = gui.addClient("novo@gmail.com", "Adriana antunes", "ods", "Rua novas", localDate);
        Assert.assertTrue(t);

        Boolean f = gui.addClient("novo@gmail.com", "Adriana antunes", null, "Rua novas", localDate);
        Assert.assertFalse(f);
    }

    @Test
    public void addDriver() {
        GUI gui = new GUI();
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);

        Boolean t = gui.addDriver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,"uminho");
        Assert.assertFalse(t);

        Boolean t1 = gui.addDriver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,null);
        Assert.assertTrue(t1);

        //Boolean f = gui.addDriver("ats@uminho.pt", "Carlos Monteiro", null, "Rua couteiro", localDate,"uminho");
        //Assert.assertFalse(f);

        Boolean f1 = gui.addDriver("admin", "Carlos Monteiro", null, "Rua couteiro", localDate,"uminho");
        Assert.assertFalse(f1);
    }

    @Test
    public void addCompany() {
        GUI gui = new GUI();

        Boolean t = gui.addCompany("uminho","sdxzi");
        Assert.assertTrue(t);

        Boolean f = gui.addCompany("admin","sdxzi");
        Assert.assertFalse(f);

        Boolean f1 = gui.addCompany("uminho",null);
        Assert.assertFalse(f1);
    }
}