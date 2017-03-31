package com.suusrian.dao.mapper;

import com.suusrian.domain.Location;
import mockit.Expectations;
import mockit.Mocked;
import mockit.Tested;
import mockit.integration.junit4.JMockit;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

@RunWith(JMockit.class)
public class LocationMapperTest {

    @Tested
    public LocationMapper locationMapper;

    @Test
    public void mapRowShouldResultInLocation(@Mocked ResultSet rs) throws SQLException {

        new Expectations() {
            {
                rs.getInt("ID");
                result = 1;

                rs.getString("LATITUDE");
                result = "lat";

                rs.getString("LONGITUDE");
                result = "long";

                rs.getString("IMAGE");
                result = "img";

                rs.getString("REMARK");
                result = "rmk";
            }
        };

        Location location = locationMapper.mapRow(rs, 1);
        assertNotNull(location);
        assertThat(location.getId(), is(1));
        assertThat(location.getLatitude(), is("lat"));
        assertThat(location.getLongitude(), is("long"));
        assertThat(location.getImage(), is("img"));
        assertThat(location.getRemark(), is("rmk"));
    }
}