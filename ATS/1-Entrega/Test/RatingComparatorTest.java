package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class RatingComparatorTest {

    @Test
    public void compare() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);
        Driver d2 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);
        Driver d3 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,2, true, 1.0, null, 0, 0, 0, "78-92-MA",null,3);

        RatingComparator ratingComparator = new RatingComparator();
        Assert.assertEquals(0,ratingComparator.compare(d1,d2),0.1);
        Assert.assertEquals(1,ratingComparator.compare(d1,d3),0.1);
        Assert.assertEquals(-1,ratingComparator.compare(d3,d2),0.1);
    }
}