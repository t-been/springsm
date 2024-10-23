package edu.sm.app.service;

import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CartRepository;
import edu.sm.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SMService<CartDto, CartDto> {

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
    public void del(CartDto cartDto) throws Exception {
        cartRepository.delete(cartDto);
    }

    @Override
    public CartDto get(CartDto cartDto) throws Exception {
        return cartRepository.selectOne(cartDto);
    }

    @Override
    public List<CartDto> get() throws Exception {
        return cartRepository.select();
    }

    public List<CartDto> findByName(CartDto cartDto){
        return cartRepository.findByName(cartDto);

    }

}








