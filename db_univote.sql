PGDMP      )                |            postgres    16.3    16.3 ;    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    5027                        2615    16398    pgagent    SCHEMA        CREATE SCHEMA pgagent;
    DROP SCHEMA pgagent;
                postgres    false            �           0    0    SCHEMA pgagent    COMMENT     6   COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';
                   postgres    false    7            
            2615    16788    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    10            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    10                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2                        3079    16399    pgagent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;
    DROP EXTENSION pgagent;
                   false    7            �           0    0    EXTENSION pgagent    COMMENT     >   COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';
                        false    3            �            1259    16813 	   candidato    TABLE     �   CREATE TABLE public.candidato (
    matricula character varying(5) NOT NULL,
    id_chapa character varying(255) NOT NULL,
    funcao character varying(255) NOT NULL
);
    DROP TABLE public.candidato;
       public         heap    postgres    false    10            �            1259    16799    chapa    TABLE     v   CREATE TABLE public.chapa (
    id_chapa character varying(255) NOT NULL,
    nome character varying(255) NOT NULL
);
    DROP TABLE public.chapa;
       public         heap    postgres    false    10            �            1259    16845    chapas_da_eleicao    TABLE     �   CREATE TABLE public.chapas_da_eleicao (
    id_eleicao character varying(255) NOT NULL,
    id_chapa character varying(255) NOT NULL
);
 %   DROP TABLE public.chapas_da_eleicao;
       public         heap    postgres    false    10            �            1259    16806    eleicao    TABLE     �   CREATE TABLE public.eleicao (
    id_eleicao character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    data date NOT NULL
);
    DROP TABLE public.eleicao;
       public         heap    postgres    false    10            �            1259    16830    eleitor    TABLE     }   CREATE TABLE public.eleitor (
    matricula character varying(5) NOT NULL,
    id_eleicao character varying(255) NOT NULL
);
    DROP TABLE public.eleitor;
       public         heap    postgres    false    10            �            1259    16892    funcoes    TABLE     v   CREATE TABLE public.funcoes (
    id_chapa character varying NOT NULL,
    funcoes character varying(100) NOT NULL
);
    DROP TABLE public.funcoes;
       public         heap    postgres    false    10            �            1259    16862    propostas_da_chapa    TABLE     �   CREATE TABLE public.propostas_da_chapa (
    id_chapa character varying(255) NOT NULL,
    propostas character varying(255) NOT NULL
);
 &   DROP TABLE public.propostas_da_chapa;
       public         heap    postgres    false    10            �            1259    16789    usuario    TABLE     �   CREATE TABLE public.usuario (
    matricula character varying(5) NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    10            �            1259    16874    votos    TABLE     �   CREATE TABLE public.votos (
    id_eleicao character varying(255) NOT NULL,
    id_chapa character varying(255) NOT NULL,
    total_de_votos integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.votos;
       public         heap    postgres    false    10            �          0    16400    pga_jobagent 
   TABLE DATA           I   COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
    pgagent          postgres    false    220   �@       �          0    16409    pga_jobclass 
   TABLE DATA           7   COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
    pgagent          postgres    false    222   A       �          0    16419    pga_job 
   TABLE DATA           �   COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
    pgagent          postgres    false    224   .A       �          0    16467    pga_schedule 
   TABLE DATA           �   COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
    pgagent          postgres    false    228   KA       �          0    16495    pga_exception 
   TABLE DATA           J   COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
    pgagent          postgres    false    230   hA       �          0    16509 
   pga_joblog 
   TABLE DATA           X   COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
    pgagent          postgres    false    232   �A       �          0    16443    pga_jobstep 
   TABLE DATA           �   COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
    pgagent          postgres    false    226   �A       �          0    16525    pga_jobsteplog 
   TABLE DATA           |   COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
    pgagent          postgres    false    234   �A       �          0    16813 	   candidato 
   TABLE DATA           @   COPY public.candidato (matricula, id_chapa, funcao) FROM stdin;
    public          postgres    false    238   �A       �          0    16799    chapa 
   TABLE DATA           /   COPY public.chapa (id_chapa, nome) FROM stdin;
    public          postgres    false    236   IB       �          0    16845    chapas_da_eleicao 
   TABLE DATA           A   COPY public.chapas_da_eleicao (id_eleicao, id_chapa) FROM stdin;
    public          postgres    false    240   yB       �          0    16806    eleicao 
   TABLE DATA           9   COPY public.eleicao (id_eleicao, nome, data) FROM stdin;
    public          postgres    false    237   �B       �          0    16830    eleitor 
   TABLE DATA           8   COPY public.eleitor (matricula, id_eleicao) FROM stdin;
    public          postgres    false    239   �B       �          0    16892    funcoes 
   TABLE DATA           4   COPY public.funcoes (id_chapa, funcoes) FROM stdin;
    public          postgres    false    243   &C       �          0    16862    propostas_da_chapa 
   TABLE DATA           A   COPY public.propostas_da_chapa (id_chapa, propostas) FROM stdin;
    public          postgres    false    241   }C       �          0    16789    usuario 
   TABLE DATA           @   COPY public.usuario (matricula, email, nome, senha) FROM stdin;
    public          postgres    false    235   D       �          0    16874    votos 
   TABLE DATA           E   COPY public.votos (id_eleicao, id_chapa, total_de_votos) FROM stdin;
    public          postgres    false    242   �D       �           2606    16819    candidato candidato_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT candidato_pkey PRIMARY KEY (matricula, id_chapa);
 B   ALTER TABLE ONLY public.candidato DROP CONSTRAINT candidato_pkey;
       public            postgres    false    238    238            �           2606    16805    chapa chapa_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.chapa
    ADD CONSTRAINT chapa_pkey PRIMARY KEY (id_chapa);
 :   ALTER TABLE ONLY public.chapa DROP CONSTRAINT chapa_pkey;
       public            postgres    false    236            �           2606    16851 (   chapas_da_eleicao chapas_da_eleicao_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.chapas_da_eleicao
    ADD CONSTRAINT chapas_da_eleicao_pkey PRIMARY KEY (id_eleicao, id_chapa);
 R   ALTER TABLE ONLY public.chapas_da_eleicao DROP CONSTRAINT chapas_da_eleicao_pkey;
       public            postgres    false    240    240            �           2606    16812    eleicao eleicao_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.eleicao
    ADD CONSTRAINT eleicao_pkey PRIMARY KEY (id_eleicao);
 >   ALTER TABLE ONLY public.eleicao DROP CONSTRAINT eleicao_pkey;
       public            postgres    false    237            �           2606    16834    eleitor eleitor_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.eleitor
    ADD CONSTRAINT eleitor_pkey PRIMARY KEY (matricula, id_eleicao);
 >   ALTER TABLE ONLY public.eleitor DROP CONSTRAINT eleitor_pkey;
       public            postgres    false    239    239            �           2606    16868 *   propostas_da_chapa propostas_da_chapa_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.propostas_da_chapa
    ADD CONSTRAINT propostas_da_chapa_pkey PRIMARY KEY (id_chapa, propostas);
 T   ALTER TABLE ONLY public.propostas_da_chapa DROP CONSTRAINT propostas_da_chapa_pkey;
       public            postgres    false    241    241            �           2606    16797    usuario usuario_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_email_key;
       public            postgres    false    235            �           2606    16795    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (matricula);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    235            �           2606    16881    votos votos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.votos
    ADD CONSTRAINT votos_pkey PRIMARY KEY (id_eleicao, id_chapa);
 :   ALTER TABLE ONLY public.votos DROP CONSTRAINT votos_pkey;
       public            postgres    false    242    242            �           2606    16825 !   candidato candidato_id_chapa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT candidato_id_chapa_fkey FOREIGN KEY (id_chapa) REFERENCES public.chapa(id_chapa);
 K   ALTER TABLE ONLY public.candidato DROP CONSTRAINT candidato_id_chapa_fkey;
       public          postgres    false    236    238    4847            �           2606    16820 "   candidato candidato_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT candidato_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.usuario(matricula);
 L   ALTER TABLE ONLY public.candidato DROP CONSTRAINT candidato_matricula_fkey;
       public          postgres    false    4845    235    238                        2606    16857 1   chapas_da_eleicao chapas_da_eleicao_id_chapa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas_da_eleicao
    ADD CONSTRAINT chapas_da_eleicao_id_chapa_fkey FOREIGN KEY (id_chapa) REFERENCES public.chapa(id_chapa);
 [   ALTER TABLE ONLY public.chapas_da_eleicao DROP CONSTRAINT chapas_da_eleicao_id_chapa_fkey;
       public          postgres    false    240    4847    236                       2606    16852 3   chapas_da_eleicao chapas_da_eleicao_id_eleicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas_da_eleicao
    ADD CONSTRAINT chapas_da_eleicao_id_eleicao_fkey FOREIGN KEY (id_eleicao) REFERENCES public.eleicao(id_eleicao);
 ]   ALTER TABLE ONLY public.chapas_da_eleicao DROP CONSTRAINT chapas_da_eleicao_id_eleicao_fkey;
       public          postgres    false    4849    240    237            �           2606    16840    eleitor eleitor_id_eleicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eleitor
    ADD CONSTRAINT eleitor_id_eleicao_fkey FOREIGN KEY (id_eleicao) REFERENCES public.eleicao(id_eleicao);
 I   ALTER TABLE ONLY public.eleitor DROP CONSTRAINT eleitor_id_eleicao_fkey;
       public          postgres    false    239    4849    237            �           2606    16835    eleitor eleitor_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eleitor
    ADD CONSTRAINT eleitor_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.usuario(matricula);
 H   ALTER TABLE ONLY public.eleitor DROP CONSTRAINT eleitor_matricula_fkey;
       public          postgres    false    239    4845    235                       2606    16897    funcoes funcoes_id_chapa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcoes
    ADD CONSTRAINT funcoes_id_chapa_fkey FOREIGN KEY (id_chapa) REFERENCES public.chapa(id_chapa) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.funcoes DROP CONSTRAINT funcoes_id_chapa_fkey;
       public          postgres    false    236    243    4847                       2606    16869 3   propostas_da_chapa propostas_da_chapa_id_chapa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.propostas_da_chapa
    ADD CONSTRAINT propostas_da_chapa_id_chapa_fkey FOREIGN KEY (id_chapa) REFERENCES public.chapa(id_chapa);
 ]   ALTER TABLE ONLY public.propostas_da_chapa DROP CONSTRAINT propostas_da_chapa_id_chapa_fkey;
       public          postgres    false    4847    241    236                       2606    16887    votos votos_id_chapa_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.votos
    ADD CONSTRAINT votos_id_chapa_fkey FOREIGN KEY (id_chapa) REFERENCES public.chapa(id_chapa);
 C   ALTER TABLE ONLY public.votos DROP CONSTRAINT votos_id_chapa_fkey;
       public          postgres    false    4847    236    242                       2606    16882    votos votos_id_eleicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.votos
    ADD CONSTRAINT votos_id_eleicao_fkey FOREIGN KEY (id_eleicao) REFERENCES public.eleicao(id_eleicao);
 E   ALTER TABLE ONLY public.votos DROP CONSTRAINT votos_id_eleicao_fkey;
       public          postgres    false    237    4849    242            �   @   x�3727�4202�5��52R04�21�20׳0403��50�tq���u1�������� ?Ni      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   ]   x�34 NC΀���̔Լ�T.C��!P(,39UM�(��\�ZrxaQf>X�(�Z�_Z��Y2�4B7�(��D3�8���@1$c���� "0�      �       x�3�t�H,HTp�2������,g�=... �F5      �      x�3�4�2�4����� ��      �   ;   x�3�t�I�<����|##N�kh�k`�e�$�Z\R���W��Ua�kd����� ���      �   -   x�34 NC.C e����1�6�ҦP�J�Ci(m	�c���� 5@�      �   G   x�3�(J-�LI�+I�2��LN�E	NM.J-9��(3�I-�/-J�,��2B�i���E���=... �O)      �   u   x�M���@ k<��"�Q��i̿�X���o(؆�A~�X4�<����a�3c�Ŵb��6����7.o5	M��m��e,�Ή`�Ί��R�c�5i!���E��d�!	����<� �Ǽ2      �   �   x�m�M
�0���9�X���SDA\�����L�.��G�b�V�ٽ���w_���Im�ՁM�PRq��׏◉�,��[�����؃Ŵ��>��u� �A3e���'�'!���}m\����n�cs!ɩ��O��W#��,L�����׎�j+�����UGN++�r9
#i���/�J;l��ƚu�����S'��'| ��      �      x�3�4�4�2�4�4����� V     