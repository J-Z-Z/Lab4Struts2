package md.victordov.lab.services;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;

public interface GenericService<T,R> {

	List<T> retrieve() throws MyDaoException;

	List<T> retrieve(Integer start, Integer maxRecords) throws MyDaoException;

	T retrieve(Integer id) throws MyDaoException;

	boolean create(T t) throws MyDaoException;

	boolean update(T t) throws MyDaoException;

	boolean delete(Integer id) throws MyDaoException;

	Long countSize() throws MyDaoException;

	List<T> transformList(List<R> r);
	
	T transform(R r);
	
	R transformBack(T t);

}
