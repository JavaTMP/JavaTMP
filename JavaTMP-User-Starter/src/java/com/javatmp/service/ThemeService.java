package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Theme;
import java.util.List;

public class ThemeService {

    private final JpaDaoHelper jpaDaoHelper;

    private List<Theme> themes;

    public ThemeService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Theme> getThemes() {
        if (this.themes == null || this.themes.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.themes == null || this.themes.isEmpty()) {
                    this.themes = this.jpaDaoHelper.findAll(Theme.class);
                }
            }
        }
        return themes;
    }

}
