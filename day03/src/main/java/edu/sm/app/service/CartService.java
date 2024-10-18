package edu.sm.app.service;

import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SMService<Integer, CartDto> {

    final CartRepository cartRepository;

    @Override
    public void add(CartDto cartDto) throws Exception {
        cartRepository.insert(cartDto);
    }

    @Override
    public void modify(CartDto cartDto) throws Exception {
        cartRepository.update(cartDto);
    }

    @Override
    public void del(Integer s) throws Exception {
        cartRepository.delete(s);
    }

    @Override
    public CartDto get(Integer s) throws Exception {
        return cartRepository.selectOne(s);
    }

    @Override
    public List<CartDto> get() throws Exception {
        return cartRepository.select();
    }

    public List<CartDto> findByName(String name) throws Exception {
        return cartRepository.findByName(name);
    }
}
