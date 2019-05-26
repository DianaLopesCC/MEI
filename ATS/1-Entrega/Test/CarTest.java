package uMer;

import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;

import static org.junit.Assert.*;

public class CarTest {

    @Test
    public void calculateTraffic() {
        UMeR uMeR = new UMeR();
        Car v1 = new Car("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        uMeR.registerVehicleP(v1);

        Car v2 = new Car(v1.clone());
        uMeR.registerVehicleP(v2);

        int d = v1.calculateTraffic(uMeR.getVehiclesP());
        int d2 = v1.calculateTraffic(uMeR.getVehiclesP());

        Assert.assertEquals(2,d,0.01);
        Assert.assertEquals(2,d2,0.01);
    }
}