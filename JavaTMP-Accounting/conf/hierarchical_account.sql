with recursive cte (id, name, parentAccountid) as (
  select     id,
             name,
             parentAccountid
  from       account
 where      parentAccountid = 2
  union all
  select     p.id,
             p.name,
             p.parentAccountid
  from       account p
  inner join cte
          on p.parentAccountid = cte.id
)
select * from cte;