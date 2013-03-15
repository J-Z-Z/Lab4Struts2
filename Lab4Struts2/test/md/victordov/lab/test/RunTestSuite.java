package md.victordov.lab.test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({TestCursDao.class,TestProfesorDao.class,TestStudentDao.class,TestUniversitateDao.class,TestStudCursDao.class})
public class RunTestSuite {
}