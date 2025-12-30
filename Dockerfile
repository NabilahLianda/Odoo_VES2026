FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf

RUN mkdir -p /var/lib/odoo && chown -R odoo:odoo /var/lib/odoo

USER odoo

EXPOSE 8069
CMD ["odoo"]
