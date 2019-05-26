package uMer;
import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

public class UMeRTest_Inicial {
    UMeR uMeR = new UMeR();
    Month month0 = Month.SEPTEMBER;
    Point2D.Double point2D_Double0 = new Point2D.Double();
    LocalDate localDate = MockLocalDate.of(4, month0, 4);

    @Test
    public void changeDriverAvailability() {
        LocalDate localDate = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos Monteiro");

        uMeR.registerUser(d1, null);
        uMeR.registerVehicleP(v);

        uMeR.changeDriverAvailability(d1.getEmail(), false);
        Assert.assertFalse(uMeR.getAllDrivers().get(d1.getEmail()).isAvailable());
    }

    @Test
    public void changeDriverVehicle() {
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "38-42-NA",null,0);
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Adriana monteiro");

        uMeR.registerUser(d1, null);
        uMeR.registerVehicleP(v);

        uMeR.changeDriverVehicle(d1.getEmail(),v.getLicencePlate());

        Assert.assertEquals(uMeR.getAllVehicles().get(v.getLicencePlate()).getLicencePlate(),uMeR.getAllDrivers().get(d1.getEmail()).getVehicle());
        //Assert.assertEquals(uMeR.getAllDrivers().get(d1.getEmail()).getEmail(),uMeR.getAllVehicles().get(v.getLicencePlate()).getOwner());
    }

    @Test
    public void registerUser() {
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,1,"uminho");
        Client c1 = new Client("novo@gmail.com", "Adriana antunes", "ods", "Rua novas", localDate);

        uMeR.registerUser(c1,null);
        Assert.assertTrue(uMeR.getClients().containsKey(c1.getEmail()));

        uMeR.registerUser(d1, "uminho");
        Assert.assertEquals(false, uMeR.getDriversP().containsKey(d1.getEmail()));

        uMeR.registerUser(d1, null);
        Assert.assertEquals(true, uMeR.getAllDrivers().containsKey(d1.getEmail()));
    }

    @Test
    public void registerVehicleP() {
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos monteiro");
        uMeR.registerVehicleP(v);
        Assert.assertEquals(true,uMeR.getVehiclesP().containsKey(v.getLicencePlate()));
    }

    @Test
    public void registerCompany() {
        Company c = new Company("uminho", "**");
        uMeR.registerCompany("uminho","**");
        Assert.assertTrue(uMeR.getCompanies().containsKey(c.getName()));
    }

    @Test
    public void registerCompanyVehicle() {
        Company c = new Company("uminho", "**");
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos monteiro");
        uMeR.registerCompany("uminho","**");
        uMeR.registerCompanyVehicle(c.getName(),v);
        Assert.assertTrue(uMeR.getAllVehicles().containsKey(v.getLicencePlate()));
    }

    @Test
    public void estimatedTime() {
        Point2D.Double point2D_Double2 = new Point2D.Double(1,7);
        double es = uMeR.estimatedTime(point2D_Double0, point2D_Double2, 2.0);
        Assert.assertEquals(4.2,es,0.1);
    }

    @Test
    public void calculateTraffic() {
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos monteiro");
        uMeR.registerVehicleP(v);
        int r = uMeR.calculateTraffic(v,5.0);
        Assert.assertEquals(2,r);

        Helicopter h = new Helicopter("28-28-UM", 3.7, point2D_Double0, "Carlos monteiro");
        uMeR.registerVehicleP(h);
        int x = uMeR.calculateTraffic(h,6.7);
        Assert.assertEquals(1,x, 0.0001);
    }

    @Test
    public void realTime() {
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,1,"uminho");
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos monteiro");
        Point2D.Double point2D_Double2 = new Point2D.Double(1,7);

        double t = uMeR.realTime(point2D_Double0,point2D_Double0,d1,v);
        Assert.assertEquals(0,t,0.0001);

        double t1 = uMeR.realTime(point2D_Double0,point2D_Double2,d1,v);
        Assert.assertEquals(0.1,t1,0.1);
    }

   @Test
    public void addTrip() {
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,1,null);
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos monteiro");
        Client c1 = new Client("novo@gmail.com", "Adriana antunes", "ods", "Rua novas", localDate);

        Point2D.Double point2D_Double2 = new Point2D.Double(1,1);
        Point2D.Double point2D_Double3 = new Point2D.Double(1,7);
        Trip t = new Trip (uMeR.getTrips().size(),  point2D_Double0,  point2D_Double3, 1.0, 1.5, localDate, "78-92-MA", "ats@uminho.pt", "novo@gmail.com", (int) 4.3, 0.55, point2D_Double2, 0.25, 0.20,2.0);

        uMeR.registerUser(c1,null);
        uMeR.registerUser(d1,null);

        uMeR.registerVehicleP(v);
        uMeR.addTrip(c1.getEmail(),d1.getEmail(),v.getLicencePlate(),t);

        Assert.assertTrue(uMeR.getTrips().contains(t));
        Assert.assertEquals(1 ,uMeR.getAllDrivers().get(d1.getEmail()).getTrips().size());
        Assert.assertEquals(1,uMeR.getClients().get(c1.getEmail()).getTrips().size());
        Assert.assertEquals(1,uMeR.getAllVehicles().get(v.getLicencePlate()).getTrips().size());
    }

    @Test
    public void addRating() {
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);
        Car v = new Car("78-92-MA", (int) 2.0, point2D_Double0, "Carlos Monteiro");
        Client c1 = new Client("novo@gmail.com", "Adriana antunes", "ods", "Rua novas", localDate);

        Point2D.Double point2D_Double2 = new Point2D.Double(1,1);
        Point2D.Double point2D_Double3 = new Point2D.Double(1,7);

        Trip t = new Trip (uMeR.getTrips().size(),  point2D_Double0,  point2D_Double3, 1.0, 1.5, localDate, "78-92-MA", "ats@uminho.pt", "novo@gmail.com", (int) 4.3, 0.55, point2D_Double2, 0.25, 0.20,2.0);

        uMeR.registerUser(c1,null);
        uMeR.registerUser(d1,null);

        uMeR.registerVehicleP(v);
        uMeR.addTrip(c1.getEmail(),d1.getEmail(),v.getLicencePlate(),t);

        uMeR.addRating(d1.getEmail(),6,t.getID());
        Assert.assertEquals(120,uMeR.getAllDrivers().get(d1.getEmail()).getRating(),0);
    }

}