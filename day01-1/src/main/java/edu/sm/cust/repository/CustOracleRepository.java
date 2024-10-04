package edu.sm.cust.repository;

import edu.sm.dto.Cust;
import edu.sm.frame.SMRepository;

public class CustOracleRepository implements SMRepository<String, Cust> {
    @Override
    public void insert(Cust cust) {
        System.out.println("Oracle Inserted: "+cust);
    }

    @Override
    public void update(Cust cust) {
        System.out.println("Oracle Updated: "+cust);
    }

    @Override
    public void delete(String s) {
        System.out.println("Oracle Deleted: "+s);
    }
}
