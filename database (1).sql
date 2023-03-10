PGDMP                         {            CaptoneTicket    14.6    14.6                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16536    CaptoneTicket    DATABASE     s   CREATE DATABASE "CaptoneTicket" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "CaptoneTicket";
                postgres    false            ?            1259    16537    feedback    TABLE     ?   CREATE TABLE public.feedback (
    feedback_id text NOT NULL,
    user_id text NOT NULL,
    message text,
    response text,
    status text
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            ?            1259    16542    route    TABLE     ?   CREATE TABLE public.route (
    route_id text NOT NULL,
    froms text,
    arrive text,
    travel_time text,
    distance text,
    image text,
    fare text,
    status text NOT NULL
);
    DROP TABLE public.route;
       public         heap    postgres    false            ?            1259    16547    station    TABLE     ?   CREATE TABLE public.station (
    station_id text NOT NULL,
    station_start text,
    station_end text,
    status text NOT NULL
);
    DROP TABLE public.station;
       public         heap    postgres    false            ?            1259    16552    ticket    TABLE     ?   CREATE TABLE public.ticket (
    ticket_id text NOT NULL,
    booking_date date NOT NULL,
    seat_no text,
    price bigint,
    status text NOT NULL,
    user_id text NOT NULL,
    trip_id text NOT NULL
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            ?            1259    16557    trips    TABLE     ?   CREATE TABLE public.trips (
    trip_id text NOT NULL,
    vehical_id text NOT NULL,
    date date,
    "time" text,
    route_id text NOT NULL,
    station_id text NOT NULL,
    status text
);
    DROP TABLE public.trips;
       public         heap    postgres    false            ?            1259    16562    users    TABLE     ?   CREATE TABLE public.users (
    user_id text NOT NULL,
    password text NOT NULL,
    fullname text NOT NULL,
    gender text NOT NULL,
    phone_number text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    status text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16567    vehicle    TABLE     ?   CREATE TABLE public.vehicle (
    vehical_id text NOT NULL,
    license_plates text NOT NULL,
    color text,
    seat text,
    vehicle_type_id text NOT NULL,
    status text NOT NULL
);
    DROP TABLE public.vehicle;
       public         heap    postgres    false                      0    16537    feedback 
   TABLE DATA           S   COPY public.feedback (feedback_id, user_id, message, response, status) FROM stdin;
    public          postgres    false    209   ?#                 0    16542    route 
   TABLE DATA           d   COPY public.route (route_id, froms, arrive, travel_time, distance, image, fare, status) FROM stdin;
    public          postgres    false    210   $                 0    16547    station 
   TABLE DATA           Q   COPY public.station (station_id, station_start, station_end, status) FROM stdin;
    public          postgres    false    211   ?%                 0    16552    ticket 
   TABLE DATA           c   COPY public.ticket (ticket_id, booking_date, seat_no, price, status, user_id, trip_id) FROM stdin;
    public          postgres    false    212   Q&                 0    16557    trips 
   TABLE DATA           `   COPY public.trips (trip_id, vehical_id, date, "time", route_id, station_id, status) FROM stdin;
    public          postgres    false    213   ?&                 0    16562    users 
   TABLE DATA           g   COPY public.users (user_id, password, fullname, gender, phone_number, email, role, status) FROM stdin;
    public          postgres    false    214   n'                 0    16567    vehicle 
   TABLE DATA           c   COPY public.vehicle (vehical_id, license_plates, color, seat, vehicle_type_id, status) FROM stdin;
    public          postgres    false    215   ?(       v           2606    16573    route Route_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.route
    ADD CONSTRAINT "Route_pkey" PRIMARY KEY (route_id);
 <   ALTER TABLE ONLY public.route DROP CONSTRAINT "Route_pkey";
       public            postgres    false    210            x           2606    16575    station Station_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.station
    ADD CONSTRAINT "Station_pkey" PRIMARY KEY (station_id);
 @   ALTER TABLE ONLY public.station DROP CONSTRAINT "Station_pkey";
       public            postgres    false    211            z           2606    16577    ticket Ticket_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.ticket DROP CONSTRAINT "Ticket_pkey";
       public            postgres    false    212            |           2606    16579    trips Trips_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT "Trips_pkey" PRIMARY KEY (trip_id);
 <   ALTER TABLE ONLY public.trips DROP CONSTRAINT "Trips_pkey";
       public            postgres    false    213            ~           2606    16581    users User_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (user_id);
 ;   ALTER TABLE ONLY public.users DROP CONSTRAINT "User_pkey";
       public            postgres    false    214            ?           2606    16583    vehicle Vehicle_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT "Vehicle_pkey" PRIMARY KEY (vehical_id);
 @   ALTER TABLE ONLY public.vehicle DROP CONSTRAINT "Vehicle_pkey";
       public            postgres    false    215            t           2606    16585    feedback feedback_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            postgres    false    209            ?           2606    16586    trips Vehicle    FK CONSTRAINT     ?   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT "Vehicle" FOREIGN KEY (vehical_id) REFERENCES public.vehicle(vehical_id) NOT VALID;
 9   ALTER TABLE ONLY public.trips DROP CONSTRAINT "Vehicle";
       public          postgres    false    3200    213    215            ?           2606    16591    feedback feedback    FK CONSTRAINT        ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 ;   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback;
       public          postgres    false    3198    209    214            ?           2606    16596    trips route    FK CONSTRAINT     {   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT route FOREIGN KEY (route_id) REFERENCES public.route(route_id) NOT VALID;
 5   ALTER TABLE ONLY public.trips DROP CONSTRAINT route;
       public          postgres    false    213    210    3190            ?           2606    16601    trips station    FK CONSTRAINT     ?   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT station FOREIGN KEY (station_id) REFERENCES public.station(station_id) NOT VALID;
 7   ALTER TABLE ONLY public.trips DROP CONSTRAINT station;
       public          postgres    false    211    213    3192            ?           2606    16606    ticket trip    FK CONSTRAINT     y   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT trip FOREIGN KEY (trip_id) REFERENCES public.trips(trip_id) NOT VALID;
 5   ALTER TABLE ONLY public.ticket DROP CONSTRAINT trip;
       public          postgres    false    213    3196    212            ?           2606    16611    ticket user    FK CONSTRAINT     {   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 7   ALTER TABLE ONLY public.ticket DROP CONSTRAINT "user";
       public          postgres    false    212    214    3198               h   x?e?A
? ??????iH?h??j$?R??'m?Y????JҪSZӸ??e+??)?%?¡Udm)?7v?d??]vN(Mb???^??+ck?qWlj?Ͳ.d         j  x????N?0???>???؉?? t F??͟ڂ$U?T??l??ҎEܣ7!
E?Eard??O?s?\n-9ټ???<????Ɂ2?3$79?????e??Ӧ??͝?l>??2????l\ZO??8NM??|D??	???E:?J?=kl4??t{02 ?@??T??4????ñ???[{???H?|?b&?v?????v?]???|<?0?????a'<N:???,?7?i??~???'??I?1KUƿz?5?}?g`??w@?]??5???u?߁D?Q?&?ځ)Il,?ma?7>?wi????R??P`?N?yn??r???!0??0?Rq%#??)?dLp.??}?-?\7P?ʶ???_s߉?t4}??/x         ?   x?+.I40?tz?k?BD?	?(?=ܵ5/!?txa??{??????%?e?\?@]&??w7?)?^T???HT)J??ɔ?&燻??2?-D?e?P???|lñ???;??ᮅ%Ț?0???BH??????????
?w??DHd^??????Ϳ??&FF???|RT
4(??Psb???? Ф??         p   x???9?0????W??A?tR?|P?p	Zkv?)?? $Z?T?a?qP"??0????%c:??~{?^???_?eo?7?ˣ߹? w?????w̧@S???`_#?9?HG         ?   x?}?1?0?ٹշ?ҳtAS?8cZ???Y<?Oַ?:?i? $? GB??>????\?G??ɥ??4Z@?Zv?K??é???R{?z?î??K?UQ,x?7??k??xl?޸/9s???Ƶ?c?t?????/ι7Ij?         i  x????n? ???S?	*08?m?v?a?v?qH??!S?L?ۏҮR?5?v??|?O??|?#?? ??٪Fg?X?<?????Z?f??!??v??	?"??ف?????m?ߔCs?[Nݧώ1Ci?f?Kg
?%?(??1*?)o?<?&l??Kr?H?`??ѼX?DB?DL?O $%??cno?
??H??W9???w??/!?Lj???R?TJ?#v???g;?;???I?1S?)Qn?kyW??|븞
?6??=)???آ???IR?w?D?????B??W??;?6Cy??c2?/&?('??kϴ?*Q!?j??&???;Lc???dx?/?D?{?~?W??}?e?7?3;?         ?   x?}?1?0???I??r17*bw?R??????F\B?7????%Yl???D??5?	??1?????m7?%?%Y*?V?#??1??d??k????mwU???9?Y?????;?h???"bDVG?H??<??R??~]?q??l?Ro-?Y?     