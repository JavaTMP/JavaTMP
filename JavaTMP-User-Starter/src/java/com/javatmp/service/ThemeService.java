package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Theme;
import java.util.LinkedList;
import java.util.List;

public class ThemeService {

    private final JpaDaoHelper jpaDaoHelper;

    private List<Theme> themes = new LinkedList<>();

    public ThemeService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
        generateThemes();
    }

    private void generateThemes() {
        this.themes.add(new Theme("default", "Default"));
        this.themes.add(new Theme("cerulean", "Cerulean"));
        this.themes.add(new Theme("cosmo", "Cosmo"));
        this.themes.add(new Theme("cyborg", "Cyborg"));
        this.themes.add(new Theme("darkly", "Darkly"));
        this.themes.add(new Theme("flatly", "Flatly"));
        this.themes.add(new Theme("journal", "Journal"));
        this.themes.add(new Theme("litera", "Litera"));
        this.themes.add(new Theme("lumen", "Lumen"));
        this.themes.add(new Theme("lux", "Lux"));
        this.themes.add(new Theme("materia", "Materia"));
        this.themes.add(new Theme("minty", "Minty"));
        this.themes.add(new Theme("pulse", "Pulse"));
        this.themes.add(new Theme("sandstone", "Sandstone"));
        this.themes.add(new Theme("simplex", "Simplex"));
        this.themes.add(new Theme("sketchy", "Sketchy"));
        this.themes.add(new Theme("slate", "Slate"));
        this.themes.add(new Theme("solar", "Solar"));
        this.themes.add(new Theme("spacelab", "Spacelab"));
        this.themes.add(new Theme("superhero", "Superhero"));
        this.themes.add(new Theme("united", "United"));
        this.themes.add(new Theme("yeti", "Yeti"));
    }

    public Long getAllCount() {
        return Long.valueOf(this.themes.size());
    }

    public List<Theme> getThemes() {
        return this.themes;
    }

}
