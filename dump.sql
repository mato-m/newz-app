PGDMP     +                     {           postgres    15.3    15.3      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     j   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3734            
            2615    16852    newz    SCHEMA        CREATE SCHEMA newz;
    DROP SCHEMA newz;
                postgres    false            �            1259    16882    article    TABLE     {  CREATE TABLE newz.article (
    art_id character varying(50) DEFAULT public.uuid_generate_v4() NOT NULL,
    art_title character varying(80) NOT NULL,
    art_img character varying(200),
    art_md character varying NOT NULL,
    art_sc character varying(50) NOT NULL,
    author character varying(50) NOT NULL,
    art_time timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE newz.article;
       newz         heap    postgres    false    10            �            1259    16867    cat    TABLE     �   CREATE TABLE newz.cat (
    cat_id character varying(50) DEFAULT public.uuid_generate_v4() NOT NULL,
    cat_name character varying(50) NOT NULL
);
    DROP TABLE newz.cat;
       newz         heap    postgres    false    10            �            1259    16890    comment    TABLE     /  CREATE TABLE newz.comment (
    comment_id character varying(50) DEFAULT public.uuid_generate_v4() NOT NULL,
    art_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    text character varying(300) NOT NULL,
    "time" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE newz.comment;
       newz         heap    postgres    false    10            �            1259    16872    subcat    TABLE     �   CREATE TABLE newz.subcat (
    sc_id character varying(50) DEFAULT public.uuid_generate_v4() NOT NULL,
    sc_name character varying(50) NOT NULL,
    cat_id character varying(50) NOT NULL
);
    DROP TABLE newz.subcat;
       newz         heap    postgres    false    10            �            1259    16853    tags    TABLE     n   CREATE TABLE newz.tags (
    art_id character varying(50) NOT NULL,
    tag character varying(50) NOT NULL
);
    DROP TABLE newz.tags;
       newz         heap    postgres    false    10            �            1259    16858    usr    TABLE       CREATE TABLE newz.usr (
    user_id character varying(50) DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(25) NOT NULL,
    email character varying(50) NOT NULL,
    pass character varying(80) NOT NULL,
    role smallint DEFAULT 0 NOT NULL
);
    DROP TABLE newz.usr;
       newz         heap    postgres    false    10            �          0    16882    article 
   TABLE DATA           ]   COPY newz.article (art_id, art_title, art_img, art_md, art_sc, author, art_time) FROM stdin;
    newz          postgres    false    237   �#       �          0    16867    cat 
   TABLE DATA           -   COPY newz.cat (cat_id, cat_name) FROM stdin;
    newz          postgres    false    235   )       �          0    16890    comment 
   TABLE DATA           J   COPY newz.comment (comment_id, art_id, user_id, text, "time") FROM stdin;
    newz          postgres    false    238   �)       �          0    16872    subcat 
   TABLE DATA           6   COPY newz.subcat (sc_id, sc_name, cat_id) FROM stdin;
    newz          postgres    false    236   �*       �          0    16853    tags 
   TABLE DATA           )   COPY newz.tags (art_id, tag) FROM stdin;
    newz          postgres    false    233   �+       �          0    16858    usr 
   TABLE DATA           A   COPY newz.usr (user_id, username, email, pass, role) FROM stdin;
    newz          postgres    false    234   �,       �           2606    16889    article article_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY newz.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (art_id);
 <   ALTER TABLE ONLY newz.article DROP CONSTRAINT article_pkey;
       newz            postgres    false    237            �           2606    16871    cat cat_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY newz.cat
    ADD CONSTRAINT cat_pkey PRIMARY KEY (cat_id);
 4   ALTER TABLE ONLY newz.cat DROP CONSTRAINT cat_pkey;
       newz            postgres    false    235            �           2606    16894    comment comment_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY newz.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);
 <   ALTER TABLE ONLY newz.comment DROP CONSTRAINT comment_pkey;
       newz            postgres    false    238            �           2606    16866    usr email_uq 
   CONSTRAINT     F   ALTER TABLE ONLY newz.usr
    ADD CONSTRAINT email_uq UNIQUE (email);
 4   ALTER TABLE ONLY newz.usr DROP CONSTRAINT email_uq;
       newz            postgres    false    234            �           2606    16876    subcat subcat_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY newz.subcat
    ADD CONSTRAINT subcat_pkey PRIMARY KEY (sc_id);
 :   ALTER TABLE ONLY newz.subcat DROP CONSTRAINT subcat_pkey;
       newz            postgres    false    236            �           2606    16916    tags tags_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY newz.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (art_id, tag);
 6   ALTER TABLE ONLY newz.tags DROP CONSTRAINT tags_pkey;
       newz            postgres    false    233    233            �           2606    16862    usr user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY newz.usr
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 5   ALTER TABLE ONLY newz.usr DROP CONSTRAINT user_pkey;
       newz            postgres    false    234            �           2606    16864    usr username_uq 
   CONSTRAINT     L   ALTER TABLE ONLY newz.usr
    ADD CONSTRAINT username_uq UNIQUE (username);
 7   ALTER TABLE ONLY newz.usr DROP CONSTRAINT username_uq;
       newz            postgres    false    234            �           2606    16985    comment art_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.comment
    ADD CONSTRAINT art_fk FOREIGN KEY (art_id) REFERENCES newz.article(art_id) ON DELETE CASCADE NOT VALID;
 6   ALTER TABLE ONLY newz.comment DROP CONSTRAINT art_fk;
       newz          postgres    false    237    238    3572            �           2606    17000    article author_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.article
    ADD CONSTRAINT author_fk FOREIGN KEY (author) REFERENCES newz.usr(user_id) ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY newz.article DROP CONSTRAINT author_fk;
       newz          postgres    false    234    237    3564            �           2606    16995    subcat cat_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.subcat
    ADD CONSTRAINT cat_fk FOREIGN KEY (cat_id) REFERENCES newz.cat(cat_id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY newz.subcat DROP CONSTRAINT cat_fk;
       newz          postgres    false    3568    235    236            �           2606    17005    article sc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.article
    ADD CONSTRAINT sc_fk FOREIGN KEY (art_sc) REFERENCES newz.subcat(sc_id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY newz.article DROP CONSTRAINT sc_fk;
       newz          postgres    false    237    236    3570            �           2606    17011    tags tag_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.tags
    ADD CONSTRAINT tag_fk FOREIGN KEY (art_id) REFERENCES newz.article(art_id) ON DELETE CASCADE NOT VALID;
 3   ALTER TABLE ONLY newz.tags DROP CONSTRAINT tag_fk;
       newz          postgres    false    3572    237    233            �           2606    16990    comment usr_fk    FK CONSTRAINT     �   ALTER TABLE ONLY newz.comment
    ADD CONSTRAINT usr_fk FOREIGN KEY (user_id) REFERENCES newz.usr(user_id) ON DELETE CASCADE NOT VALID;
 6   ALTER TABLE ONLY newz.comment DROP CONSTRAINT usr_fk;
       newz          postgres    false    3564    234    238            �   `  x��U�n�8}���ph�/�d0�t��������lŶ���x=_��X��<N?&�Ţ��S�()󠱎�`��6�Y�}�,������YG�C��v@�%VJF�b#��\c�%5�;߮�*��}����zѱ�El��D�m��~Tݏ��˗��/��˗/��%b��n�u�����"lP�nS����25u��D�c����y]��(�eQ��ŀ1��^,
�p�r�����^Ѡ��jG�3�
,��8���hr+H.�$j �1�D"lB���1�R=Ԃh�]�F��q[#&�3鼦��AV?�q�^�x�h��j���KO Sk-�Xu+����g9�^M7�f��o�?�7,��!��{7[�����ߞe��������}����<|]]��C�������}v��e�o������H'����jׁxr��aQ�һ_PVWm���~���,���ݗ�]����Z�r�l�G���&>Z�m��������޵�<�}�9��<����Z������mٮ���[��Az(C�Q�v��F��N!��$���ޟ���q0����][w'ΐ_�M^��>�m<C���д1�M�;C�C���n`�)}�K��ghs�]�����z��)��_O����~�4���71���k���7�:��^V�K�WH�T�xp�K�9F@����:�D,�X(K�s�b�G%s�c�j'�����C4�^�����[/@�D/e���Av@�{�;�f�-}�g �X����	#�³e��qU��m����v������ˢx$���؃��U�.�m{�f�=��|ݶ=VW�U+��GW=�+�d�q����1���,�њ@憆\I��g c�7)j6E�>�[i4؈��(Rp+rM�U����������6��Q���VPi�����Ż9�O�������W.���8�tF��91c h�a���PV��� ����Q�]�S_zL?F�*s!������z�vy	֪� ��	�pQ8�
�X�ſNO8�=�)J�&V`� <a��N�^*������fzq��*�&�� V�"�Zq!����)1����1ul1]�>�sh�����έ ��k�I��(+ݦDF�>���b�UL�����8 ��8Mu�ހ'<�y[��M��UO��J�tq&��3�o�U�v[�~�IN�tvA�|��p��N��[S���0i�Fc��P"i7潓0	�ky�O�2U��� ��nSV�Z���UQ't���גcI����V���#-��_0�"ʁ��+���c�}�V�50n.^#��I�������#��=8p߲y򇏃ByK�Yh��8e:'�E�)�&���-��'Ҏ������p8�/�ֱ      �      x��A�  �s�KhJ���%	��(u*�y�$����"�C�ER�=�r�S�����(+cD s��ݝ�F^���g?�7ԎM�4*h%%6�1���"-�揱���/�N!�?
�)�      �   �   x��αq�0 �Z�B : PK�I����
'>����6]گ^��s8d�$��}W���ZX7��M�pC�P\2 &�F=���"bT`�;H�����V�V�<}�n��2��/�cy^����\_�X�k�?&FN���Ƹ	�X4�yD�ӹ��q����R��ڦ�w#�{5�bPB��jO��ۯ���c��Jn�>��<���O�      �   *  x���1n\1Dk���EJ"ˤ��b� U���X����l���a��ۚ�����u�
��G����\>o�Q<�P���~F�1�JZVU\5142�9 x(�"��ѝB��r�~���c@�m���(`�
.��!��.����c����w�9P�s;S�L3�6��Y~]�n��E���� )�������ss��#�W�`kV�9\��fJ����O�������U	h��'�r���%�珗���E l�ܸ�}�ê�Y W>Z��h#0������A��~q&�,϶���cĿO�q|���      �   �   x����q�0EѵXE@ A����gkb}Fv���4���y��ф�&&XT@+WP!�1�нL��k��]��y�xl�5|�ũj��xИ8HEA�����ضw���~���v�(\�C���"h���G�B-���k_�Ŝb,M@:���gh���:���C'��gw�(*C�3�sH`�55��)P��b�`��W�����~��ENB`��|��
N6_s���[�y��ۧs��^      �   �  x�mTYo�8}��W�q�6,Z�P�TW��BB.Ih¯���hF�}9>�,�ş�sX��8��"���� ��AeEf>�4*���/S���W��Ţ�p7��zO���F�aR�3���������>d�����B.�uUn~������B��$�Ph��S@o%��wL%�G��"�����!V��4<(�1��7OjԔo��as��/��Jf�DGX�3{�g�m7�փ��X�c��3|K10�K�+)VN��0ɇ��ٿ��\���"9�_��a���P�<�*�)��ݢ�H�*vW��˯&�
YO�Q�"|!`V��R�i,��0t�.�]�r���&��J��[o��@S�I�W��K�Nǁg��G��g��y�z�sA�`�!A5� )�h@�Fx��o%|ǻ^��ɶ*�Q*{���Ys���A��r=��C���+�����lӯ|��5@Z��|��H��X�$P0pDb��~s��?��C�\Ω_48y͈�3#.��D���uܿ>�\�NY8���xD3u���v�}϶1!�/
%z��i����2���S(n���������bk'��<�i�� �&.���aX����=M�n�$���[X�'mZ
�'���W�����!������W��ᒓ���1�}{�W����Vo�z4�/�&Y�[\nkf�[d�l$� %J!FE�FƑ��NI��
;�d�&�k���
��Z h%��Hm������r;��߆|Mz     