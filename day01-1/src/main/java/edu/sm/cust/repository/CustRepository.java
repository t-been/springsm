package edu.sm.cust.repository;

import edu.sm.dto.Cust;
import edu.sm.frame.SMRepository;

public class CustRepository implements SMRepository<String, Cust> {
    @Override
    public void insert(Cust cust) {
        System.out.println("Inserted: "+cust);
    }

    @Override
    public void update(Cust cust) {
        System.out.println("Updated: "+cust);
    }

    @Override
    public void delete(String s) {
        System.out.println("Deleted: "+s);
    }
}
