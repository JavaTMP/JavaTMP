package com.javatmp.module.timezone.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.module.timezone.entity.Timezone;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

@Slf4j
@Scope(value = "application", proxyMode = ScopedProxyMode.TARGET_CLASS)
@Service("timezoneService")
public class TimezoneService extends JpaRepository<Timezone, String> {

    private Map<String, List<Timezonetranslation>> timezones;

    public TimezoneService(EntityManagerFactory emf) {
        super(Timezone.class, emf);
    }

    private void generateAllTimezones() {
        // prepare a list of timezones - you should prepare them once instead of each request.
        String[] ids = TimeZone.getAvailableIDs();
        for (String id : ids) {
            this.generateTimezone(id);
        }
    }

    private Timezone generateTimezone(String id) {
        // prepare a list of timezones - you should prepare them once instead of each request.

        TimeZone zone = TimeZone.getTimeZone(id);
        int offset = zone.getRawOffset() / 1000;
        int hour = offset / 3600;
        int minutes = (offset % 3600) / 60;
        String displayName = zone.getDisplayName();
        String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
        String offsetDescription = String.format("GMT%+03d:%02d", hour, Math.abs(minutes));
        String displayTimezoneInfo = String.format("(%s) %s - %s (%s)", offsetDescription, id, displayName, d);
        return new Timezone(id, d, offsetDescription, displayName, displayTimezoneInfo);

    }

    public List<Timezonetranslation> getTimezones(User localeUser) {
        if (this.timezones == null || this.timezones.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.timezones == null || this.timezones.isEmpty()) {
                    this.timezones = new HashMap<>();
                    List<Timezonetranslation> all = this.getTimezones();
                    all.forEach((row) -> {
                        if (this.timezones.containsKey(row.getTimezonetranslationPK().getLangId()) == false) {
                            this.timezones.put(row.getTimezonetranslationPK().getLangId(), new LinkedList<>());
                        }
                        Timezone current = generateTimezone(row.getTimezonetranslationPK().getTimezoneId());
                        row.setTimezone(current);
                        this.timezones.get(row.getTimezonetranslationPK().getLangId()).add(row);
                    });
                }
            }
        }
        return this.timezones.get(localeUser.getLang());
    }

    public List<Timezonetranslation> getTimezones() {

        EntityManager em = null;
        List<Timezonetranslation> retList = null;
        try {
            em = emf.createEntityManager();
            TypedQuery<Timezonetranslation> query = em.createQuery(
                    "select "
                    + "new com.javatmp.module.timezone.entity.Timezonetranslation("
                    + "l.timezoneId, lt1.timezonetranslationPK.langId, coalesce(lt1.timezoneName, lt2.timezoneName)"
                    + ") from Timezone l "
                    + "left outer join Timezonetranslation lt1 on lt1.timezonetranslationPK.timezoneId = l.timezoneId "
                    + "left outer join Timezonetranslation lt2 on lt2.timezonetranslationPK.timezoneId = l.timezoneId "
                    + "join Language deflan on deflan.languageId=lt2.timezonetranslationPK.langId and deflan.isDefaultLang = 1 "
                    + "", Timezonetranslation.class
            );
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public Long getAllCount() {
        return Long.valueOf(this.timezones.size());
    }

}
