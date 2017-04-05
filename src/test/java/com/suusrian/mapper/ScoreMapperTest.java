package com.suusrian.mapper;

import com.suusrian.domain.Score;
import mockit.Expectations;
import mockit.Mocked;
import mockit.Tested;
import mockit.integration.junit4.JMockit;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.sql.ResultSet;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

@RunWith(JMockit.class)
public class ScoreMapperTest {

    @Tested
    public ScoreMapper scoreMapper;

    @Test
    public void mapRowShouldResultInScore(@Mocked ResultSet rs) throws Exception {
        new Expectations() {{
            rs.getInt("ID");
            result = 0;

            rs.getDouble("DISTANCE");
            result = 1.23;

            rs.getInt("POINTS");
            result = 4;
        }};

        Score score = scoreMapper.mapRow(rs, 1);
        assertNotNull(score);
        assertThat(score.getId(), is(0));
        assertThat(score.getDistance(), is(1.23));
        assertThat(score.getPoints(), is(4));
    }

}