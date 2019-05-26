package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;

import static org.junit.Assert.*;

public class CompanyTest {

    @Test
    public void getName() {
        Company c = new Company("uminho","sdxzi");
        String nome = c.getName();

        Assert.assertEquals(c.getName(),nome);
    }

    @Test
    public void getPassword() {
        Company c = new Company("uminho","sdxzi");
        String pass = c.getPassword();

        Assert.assertEquals(c.getPassword(),pass);
    }

    @Test
    public void addDriver() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);

        Company c = new Company("uminho","sdxzi");
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,1,"uminho");

        c.addDriver(d1);

        Assert.assertTrue(c.getDrivers().containsKey(d1.getEmail()));
    }

    @Test
    public void addVehicle() {
        Point2D.Double point2D_Double0 = new Point2D.Double();

        Company c = new Company("uminho","sdxzi");
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Adriana monteiro");

        c.addVehicle(v);

        Assert.assertTrue(c.getVehicles().containsKey(v.getLicencePlate()));
    }

    @Test
    public void equals() {
        Company c = new Company("uminho","sdxzi");
        Company c2 = new Company(c.clone());
        assertTrue(c.equals(c2));

        Company c3 = new Company("ipca","sdsadi");
        assertFalse(c.equals(c3));
    }

    @Test
    public void availiableTaxis() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate0,1,"uminho");
        Company c = new Company("uminho","sdxzi");

        Assert.assertFalse(c.availiableTaxis());

        c.addDriver(d1);
        Assert.assertTrue(c.availiableTaxis());
    }

    @Test
    public void pickDriver() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate0,1,"uminho");
        Company c = new Company("uminho","sdxzi");

        c.addDriver(d1);
        Assert.assertEquals(d1.getEmail(),c.pickDriver());
        d1.setAvailability(false);
        Assert.assertNotEquals(d1.getEmail(),c.pickDriver());
    }

    @Test
    public void pickVehicle() {
        Car v1 = new Car("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        Car v2 = new Car("65-25-GS", 4, new Point2D.Double(2,8), "Carlos Perieira");

        Point2D.Double pos = new Point2D.Double();

        Company c = new Company("uminho","sdxzi");

        Assert.assertEquals(null,c.pickVehicle(pos));

        c.addVehicle(v1);
        c.addVehicle(v2);

        Assert.assertEquals(v1.getLicencePlate(),c.pickVehicle(pos));
        Assert.assertNotEquals(v2.getLicencePlate(),c.pickVehicle(pos));
    }

    @Test
    public void addTrip() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        Company c = new Company("uminho","sdxzi");

        c.addTrip(t1);

        Assert.assertEquals(1,c.getTotalTrips());
    }

    @Test
    public void getDates() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        LocalDate localDate1 = MockLocalDate.of(4, month0, 10);
        Trip t2 = new Trip(2, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate1, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        Month month1 = Month.NOVEMBER;
        LocalDate localDate2 = MockLocalDate.of(4, month1, 10);
        Trip t3 = new Trip(2, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate2, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        Company c = new Company("uminho","sdxzi");

        c.addTrip(t1);
        c.addTrip(t2);

        ArrayList<String> aux = c.getDates();

        Assert.assertTrue(aux.contains(t1.getDate().toString()));
        Assert.assertTrue(aux.contains(t2.getDate().toString()));
        Assert.assertFalse(aux.contains(t3.getDate().toString()));
    }

    @Test
    public void moneyGeneratedBetween() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        LocalDate localDate1 = MockLocalDate.of(4, month0, 10);
        Trip t2 = new Trip(2, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate1, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        double total = t1.getPrice() + t2.getPrice();

        Company c = new Company("uminho","sdxzi");
        c.addTrip(t1);
        c.addTrip(t2);

        Assert.assertEquals(total, c.moneyGeneratedBetween(localDate0,localDate1),0.001);
    }

}