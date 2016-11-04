package com.iquest.controller;

import com.iquest.model.User;
import com.iquest.service.impl.exception.ServiceException;
import com.iquest.service.impl.UserServiceImpl;
import com.iquest.service.impl.exception.InvalidEntityException;
import com.iquest.service.impl.exception.InvalidUsernameException;
import com.iquest.service.impl.exception.NegativeIdentifierException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * This class handles all requests which contain "/user" in their paths
 *
 * @author marian.david
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> createUser(@RequestBody User user) throws ServiceException {
        userService.create(user);
        return Collections.singletonMap("message", "User account was successfully created.");
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Map<String, String> updateUser(@RequestBody User user) throws ServiceException {
        userService.update(user);
        return Collections.singletonMap("message", "User account was successfully updated.");
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User getUser(@PathVariable("id") Integer id) throws InvalidEntityException, NegativeIdentifierException,
            ServiceException {
        return userService.find(id);
    }

    @RequestMapping(value = "/get/all", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getUsers() throws ServiceException {
        return userService.findAll();
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, String> deleteUser(@PathVariable("id") Long id) throws InvalidEntityException,
            NegativeIdentifierException, ServiceException {
        userService.delete(id);
        return Collections.singletonMap("message", "User account was successfully deleted.");
    }

    @RequestMapping(value = "/get/{username}", method = RequestMethod.GET)
    @ResponseBody
    public User findUserByUsername(@PathVariable("username") String username) throws InvalidEntityException,
            InvalidUsernameException, ServiceException {
        return userService.findByUsername(username);
    }
}
