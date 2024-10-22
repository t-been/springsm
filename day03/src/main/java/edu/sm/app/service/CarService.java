package edu.sm.app.service;

import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CartDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService implements SMService<Integer, CarDto> {

    final CarRepository carRepository;

    @Override
    public void add(CarDto carDto) throws Exception {
        carDto.setCarRegDate(LocalDateTime.now());
        carRepository.insert(carDto);
    }


    @Override
    public void modify(CarDto carDto) throws Exception {
        carRepository.update(carDto);
    }

    @Override
    public void del(Integer integer) throws Exception {
        carRepository.delete(integer);
    }

    @Override
    public CarDto get(Integer integer) throws Exception {
        return carRepository.selectOne(integer);
    }

    @Override
    public List<CarDto> get() throws Exception {
        return carRepository.select();
    }

    public List<CarDto> findByName(CarDto carDto) {
        return carRepository.findByName(carDto);
    }
}