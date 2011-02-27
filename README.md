# PostGIS Example App

A (simple) Rails example app using PostGIS

## Migrations

There are three intersting points in the migrations:
* How you just t.<choose-one-geom> :name
* SRID 4326, more info ![here](http://en.wikipedia.org/wiki/World_Geodetic_System)
* `:spatial => true` on an add_index

## Models

### Mark (Point)

A simple X,Y Point.


### Path (Line String)

In other words, an array of points..


### Region (Polygon)

Put it simple, an array of points but a[0] should eql a[-1]
(careful with rings)


## PostgreSQL

Creating an UTF8 database (optional, you might have one)

    export PGROOT="/var/lib/postgres"
    mkdir -p $PGROOT/data && chown postgres.postgres $PGROOT/data
    su - postgres -c "/usr/bin/initdb -E utf8 --locale=en_US.UTF-8 $PGROOT/data"


## PostGIS

Installing PostGIS is simple:

    su postgres
    psql template1

    create database template_postgis with template = template1;
    UPDATE pg_database SET datistemplate = TRUE where datname = 'template_postgis';
    \c template_postgis
    CREATE LANGUAGE plpgsql;


Now just find the right path for your OS, some that I know:

arch
    \i /usr/share/postgresql/contrib/postgis.sql;
    \i /usr/share/postgresql/contrib/spatial_ref_sys.sql;

centos x86_64
    \i /usr/share/pgsql/contrib/lwpostgis-64.sql;
    \i /usr/share/pgsql/contrib/spatial_ref_sys.sql;

debian
    \i /usr/share/postgresql-8.3-postgis/lwpostgis.sql;
    \i /usr/share/postgresql-8.3-postgis/spatial_ref_sys.sql;

ubuntu (10.4) with postgresql 8.4
    \i /usr/share/postgresql/8.4/contrib/postgis.sql;
    \i /usr/share/postgresql/8.4/contrib/spatial_ref_sys.sql;

ubuntu (10.10) with postgresql 8.4
    \i /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql;
    \i /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql;

osx
    \i /opt/local/postgis/lwpostgis.sql;
    \i /opt/local/postgis/spatial_ref_sys.sql;

os x (10.6) with postgresql 9.0.3 and postgis 1.5.2 installed via homebrew
    \i /usr/local/Cellar/postgis/1.5.2/share/postgis/postgis.sql;
    \i /usr/local/Cellar/postgis/1.5.2/share/postgis/spatial_ref_sys.sql;

Now to finish:

    GRANT ALL ON geometry_columns TO PUBLIC;
    GRANT ALL ON spatial_ref_sys TO PUBLIC;
    VACUUM FREEZE;


## FAQ

### I can`t find postgis.sql / spatial_ref_sys.sql location. What should i do?

  Well, it's depend on your system.

  * Debian / Ubuntu

        dpkg -L postgresql-VERSION-postgis | egrep "(spatial_ref_sys|postgis).sql"

  * ArchLinux (not tested, but should work)

        pacman -Ql postgis | egrep "(spatial_ref_sys|postgis).sql"

  * CentOS / Fedora / Redhat / where installed yum ;) (not tested, but should work)

      Install _yum-utils_ which contains _repoquery_, then:

        repoquery --list PACKAGE | egrep "(spatial_ref_sys|postgis).sql"

  * MacOS X (homebrew)

        brew list postgis | egrep "(spatial_ref_sys|postgis).sql"


