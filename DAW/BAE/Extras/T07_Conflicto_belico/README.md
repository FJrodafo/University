Una organización internacional pretende realizar un seguimiento de los conflictos bélicos que se producen en todo el mundo. Para ello creará una BD que responderá al siguiente análisis:

Se entiende por conflicto cualquier lucha armada que afecte a uno o varios países y en el cual se produzcan muertos y/o heridos. Todo conflicto se identificará por un nombre que habitualmente hará referencia a la zona o causa que provoca el conflicto, aunque dado que este nombre puede cambiar con el paso del tiempo, dentro de la BD cada conflicto se identificará mediante un código numérico sin significado alguno. Para cada conflicto se desea recoger los países a los que afecta, así como el número de muertos y heridos contabilizados hasta el momento.

Los conflictos pueden ser de distintos tipos según la causa que lo ha originado, clasificándose, a lo sumo, en cuatro grupos: territoriales, religiosos, económicos o raciales, en cada uno de estos grupos se recogerán diversos datos. En los conflictos territoriales se recogerán las regiones afectadas, en los religiosos las religiones afectadas, en los económicos las materias primas disputadas y en los raciales las etnias enfrentadas.

En los conflictos intervienen diversos grupos armados (al menos dos) y diversas organizaciones mediadoras (podría no haber ninguna). Los mismos grupos armados y organizaciones mediadoras pueden intervenir en diferentes conflictos. Tanto los grupos armados como las organizaciones mediadoras podrán entrar y salir del conflicto, en ambos casos se recogerá tanto la fecha de incorporación como la fecha de salida. Temporalmente, tanto un grupo armado como una organización mediadora podrían no intervenir en conflicto alguno.

De cada grupo armado se recoge el código que se le asigna y un nombre. Cada grupo armado dispone de al menos una división y es liderado por al menos un líder político. Las divisiones de que dispone un grupo armado se numeran consecutivamente y se registra el número de barcos, tanques, aviones y hombres de que dispone, asimismo se recoge el número de bajas que ha tenido. Para los grupos armados se recoge el número de bajas como suma de las bajas producidas en todas sus divisiones.

Los traficantes de armas suministran diferentes tipos de arma a los grupos armados. De cada tipo de armas se recoge un nombre y un indicador de su capacidad destructiva. De cada traficante se recoge un nombre, los diferentes tipos de arma que puede suministrar y cantidad de armas de cada uno de los tipos de arma que podría suministrar. Se mantiene el número total de armas de cada uno de los diferentes tipos de armas suministrado por cada traficante a cada grupo armado.

Los lideres políticos se identifican por su nombre y por el código de grupo armado que lideran. Además se recoge una descripción textual de los apoyos que éste posee.

Cada división la pueden dirigir conjuntamente un máximo de tres jefes militares, aunque cada jefe militar no dirige más de una división. A cada jefe militar se le identifica por un código, además se recoge el rango que éste posee, y dado que un jefe militar no actúa por iniciativa propia sino que siempre obedece las órdenes de un único líder político de entre aquellos que lideran al grupo armado al que el jefe pertenece, se registrará el líder político al que obedece.

De las organizaciones mediadoras se recogerá su código, su nombre, su tipo (gubernamental, no gubernamental o internacional), la organización de que depende (una como máximo), el número de personas que mantiene desplegadas en cada conflicto y el tipo de ayuda que presta en cada conflicto que será de uno y sólo uno de los tres tipos siguientes: médica, diplomática o presencial.

Con diversos fines, los líderes políticos dialogan con las organizaciones; se desea recoger explícitamente esta información. Así para cada líder se recogerán aquellas organizaciones con que dialoga y viceversa.

<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Extras/T07_Conflicto_belico/Assets/Dark.svg">
    <img alt="Conflicto bélico" src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Extras/T07_Conflicto_belico/Assets/Light.svg">
</picture>