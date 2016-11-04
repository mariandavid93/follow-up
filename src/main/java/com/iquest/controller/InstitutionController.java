package com.iquest.controller;

import com.iquest.model.Institution;
import com.iquest.service.impl.exception.ServiceException;
import com.iquest.service.impl.InstitutionServiceImpl;
import com.iquest.service.impl.exception.InvalidEntityException;
import com.iquest.service.impl.exception.NegativeIdentifierException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * This class handles all requests which contain "/institution" in their paths
 *
 * @author marian.david
 */
@Controller
@RequestMapping("/institution")
public class InstitutionController {
    @Autowired
    private InstitutionServiceImpl institutionService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> createInstitution(@RequestBody Institution institution) throws ServiceException {
        institutionService.create(institution);
        return Collections.singletonMap("message", "Institution was successfully created.");
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Map<String, String> updateInstitution(@RequestBody Institution institution) throws ServiceException {
        institutionService.update(institution);
        return Collections.singletonMap("message", "Institution was successfully updated.");
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Institution getInstitution(@PathVariable("id") Integer id) throws InvalidEntityException,
            NegativeIdentifierException, ServiceException {
        return institutionService.find(id);
    }

    @RequestMapping(value = "/get/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Institution> getInstitutions() throws ServiceException {
        return institutionService.findAll();
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, String> deleteInstitution(@PathVariable("id") Long id) throws InvalidEntityException,
            NegativeIdentifierException, ServiceException {
        institutionService.delete(id);
        return Collections.singletonMap("message", "Institution was successfully deleted.");
    }

    @RequestMapping(value = "/get/{name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Institution> getInstitutionsByName(@PathVariable("name") String name) throws ServiceException {
        return institutionService.getInstitutionsByName(name);
    }
}
