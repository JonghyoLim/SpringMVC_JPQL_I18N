/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;



/**
 *
 * @author hyoku
 */
@Service
public class BeersService {

    public List<Beers> getAllBeers() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Beers> tq = em.createNamedQuery("Beers.findAll", Beers.class);
        System.out.println("Display All Beers");
        List<Beers> beerList = new ArrayList<>();
        try {
            beerList = tq.getResultList();
        } catch (Exception e) {
            System.out.println(e);
        }
        return beerList;
    }
        
             
    public List<Beers> getBeersSearchByNameResult(String beer) {
       
        EntityManager em = DBUtil.getEmf().createEntityManager();
//      name = "Beer.findByNameLikeConcat", query = "SELECT b FROM Beer b WHERE b.name LIKE CONCAT('%, :name,'%')"
        TypedQuery<Beers> tq = em.createNamedQuery("Beers.findByNameLikeConcat", Beers.class).setParameter("name", beer);
      
        List<Beers> beerList = new ArrayList<>();
        try {
            beerList = tq.getResultList();
        } catch (Exception e) {
            System.out.println(e);
        }
        return beerList;
    }
    
    
    
    public Beers findByID(int id) {
        
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Beers> tq = em.createNamedQuery("Beers.findById", Beers.class).setParameter("id", id);

        Beers b = null;
        try {
            b = tq.getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
        return b;
    }
    
    
    
    public Boolean editSellingPrice(int id, double price) {
        
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Beers> tq = em.createNamedQuery("Beers.findById", Beers.class).setParameter("id", id);
        EntityTransaction transaction = em.getTransaction();

        Beers b = null;
        try {
            b = tq.getSingleResult();    
            b.setSellPrice(price);
            System.out.println("Beers: " + id +" "+ b.getSellPrice());
            transaction.begin();
            em.merge(b); 
            transaction.commit();
        } catch (Exception e) {
            System.out.println("Error Edit selling Price" + e);
            return false;
        } finally {
            em.close();
        }
        return true;
    }
    
    
    
}
