--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(255),
    vendor character varying(255),
    description text,
    rating double precision,
    price double precision,
    img_paths json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    last_name character varying(255) NOT NULL,
    phone_number character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2023_05_23_161848_alter_users_table	1
6	2023_05_23_163120_create_products_table	1
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, vendor, description, rating, price, img_paths, created_at, updated_at) FROM stdin;
1	Wyatt	Towne, Spencer and Wisoky	Excepturi vel sit eaque aut. Odit nihil cupiditate error eligendi aut. Distinctio dolores voluptatem ea nam voluptate magni animi. Nihil veniam unde rerum sint. Quod est adipisci et. Nostrum accusamus repudiandae dolorum velit temporibus impedit commodi. Perspiciatis maxime dolore sapiente ea assumenda blanditiis ullam. Cumque dignissimos corporis minima illo odio quasi. Nihil quia ipsa sunt vero molestiae error. Occaecati hic aut quam quam tempora dicta. Explicabo molestias dignissimos voluptate est ipsum explicabo repellat. Odio fuga impedit quia facilis. Veritatis saepe neque neque id sunt. Nulla aliquid debitis ipsam non sunt ullam. Et corporis ducimus laudantium quasi aspernatur enim ab. Architecto deserunt molestias nihil ut omnis deserunt. Rem at et aliquid quam cumque occaecati veritatis. Qui dolorum dolorem asperiores et id rerum quo. Voluptas non in consequatur. Id ut soluta voluptates ad. Sed nihil rem dolor modi. Voluptatibus autem atque et. Quia minus et doloribus dolore omnis. Est et corporis dolor iusto dolorum molestiae. Sit omnis accusantium aut ut. Aut aut molestiae sint nesciunt alias ut perspiciatis. Ut sunt exercitationem ut totam neque. Possimus at asperiores tempora modi et. Nisi error recusandae sequi blanditiis soluta ut placeat. Velit odit iure id ad. Quibusdam exercitationem libero vel aliquam sit quis qui. Sunt quae et ea quisquam non ullam. Id voluptates molestiae nostrum architecto. Sint illo eum dignissimos culpa mollitia ipsam est. Quia sunt officiis non eum voluptate. Dolorem nulla illo in est nihil. Aut laboriosam qui labore vel dolor rem.	4.6	378145	["\\/tmp\\/fakern8Yhh2"]	2023-05-23 19:56:06	2023-05-23 19:56:06
2	Alyce	Smitham LLC	Expedita doloribus quo quia omnis. Corporis quisquam magni quibusdam illum sunt earum illum. Soluta neque numquam et cupiditate corporis necessitatibus. Commodi occaecati praesentium possimus ea sapiente voluptatum. Accusantium voluptas quas numquam quisquam. Omnis tenetur sit sequi autem mollitia. Similique atque iusto ut aut sunt et. Quia aut vel neque est et sit nemo. Recusandae molestias quos aut tempore cum. Sapiente non ut velit libero et est aut. Consequatur quis dolore ab temporibus rem dolore. Et aspernatur quaerat nesciunt distinctio maxime. Voluptatem minima facere nesciunt voluptate ab. Nihil velit reprehenderit eum quam quasi excepturi. Aut velit quaerat expedita sed eum. Doloribus et quisquam dolores harum dolorum accusamus. Est voluptatum sit nulla dolores et. Accusamus temporibus et nesciunt velit. Distinctio dolorem aspernatur ut cupiditate itaque. Eveniet quo voluptate alias illo mollitia labore. Voluptatem quia asperiores aliquid dicta. Rerum reiciendis sit iure voluptatum quod dignissimos est. Ipsum esse error dolor omnis. Dicta quos rerum natus corrupti totam voluptatem. Aut sit reprehenderit qui. Facere alias reprehenderit omnis nihil ipsa. Illum voluptatem ex doloribus harum quibusdam aut fugiat. Neque voluptatem dolores animi aperiam. Omnis reprehenderit dicta quam maiores enim distinctio veritatis facilis. Ut sit aliquid aut sapiente sit sunt autem. Sed accusamus ut voluptas culpa fugit. Quibusdam architecto sed hic ut explicabo. Molestias eos porro velit quibusdam debitis. Tempora unde libero iure laboriosam enim voluptas. Voluptatem in sit quaerat quasi quisquam expedita maiores. At accusantium facere dolorum magnam omnis saepe officiis. Unde sint et ut ipsum voluptatibus veniam recusandae. Et non ratione eaque minus est illum. Quo atque ut nihil. Tempore rerum nihil dolorem sunt dolores. Qui alias quia quis sed. Nulla quia ex eos officiis illo blanditiis. Dolor quaerat repellendus est magni. Quod maxime culpa nihil. Aliquid dolor vel dignissimos. Repellendus qui sint quia nostrum non et architecto. Amet laboriosam enim totam quia. Consequatur aut debitis temporibus molestiae dolores.	0.1	131321	["\\/tmp\\/faker5ZZmCN"]	2023-05-23 19:56:06	2023-05-23 19:56:06
3	Riley	Larkin Inc	Modi qui voluptate quidem. Qui ea harum corrupti enim quidem odio dicta. Voluptatem ea tempore voluptas magni amet perferendis. Repellat totam nam vero laudantium numquam. Odio placeat labore ab dicta. Dolor fuga nesciunt veritatis aut omnis odit. Non hic architecto sint corporis illum. Exercitationem quia corporis quam vitae. Et quas et delectus. Eos unde at nesciunt sed dicta. Optio in nostrum quae sed est vitae et. Recusandae consectetur voluptas id inventore. Et aut placeat beatae officiis rerum odit. Veritatis sed tenetur temporibus sit rerum officiis blanditiis. Dolore odio expedita ut veritatis iure saepe itaque dolorem. Quod vitae quas officiis illum et possimus aliquid. Ut accusamus voluptatem sed voluptatem sit voluptatem dolorem. Modi quia et nisi ad accusamus. Recusandae est dolores qui sunt qui maxime quis. A numquam quia ut nulla quae sit. Fuga hic et at veritatis sunt aliquid quibusdam. Quos ab cupiditate deserunt vel praesentium. Rerum sapiente tenetur vel ipsam. Iste voluptate perspiciatis quibusdam at. Ab esse sed assumenda velit voluptates. Et qui veritatis ducimus sit enim tempora consequatur. Vero eos ut fuga. Cum at vel magni sit vel ex et. Mollitia nihil fuga labore quis consequatur. Et consequuntur explicabo aliquid quidem quia exercitationem. Facere dicta beatae natus porro assumenda. Velit rerum provident saepe provident exercitationem consectetur quis. Rerum qui dolores ipsam ducimus enim voluptates. Autem ex doloribus est consequuntur laborum aut quis. Porro maxime odio corrupti. Quasi nam possimus officia maiores. Eos et dolor ratione libero ut modi magnam. Architecto et id corporis dolorem qui.	4.2	463361	["\\/tmp\\/fakerQhQVji"]	2023-05-23 19:56:06	2023-05-23 19:56:06
4	Ima	O'Kon, Langworth and Yundt	Ducimus est sit quo nulla qui necessitatibus illum. Accusantium et sit optio enim omnis ex. Sint quisquam dolore rerum blanditiis quo assumenda impedit et. Sit velit optio laudantium beatae ut ipsam recusandae. Aspernatur iusto magni enim doloremque commodi voluptatem sequi. Totam et non omnis doloribus quibusdam fugiat perferendis. Et ipsum sint enim hic saepe et. Sint qui numquam et quasi neque quam. Quisquam vitae qui tempora facere modi nesciunt incidunt. Molestiae illo et fuga et officiis amet nam earum. Ullam aliquam consequatur placeat odio sint qui molestiae. Neque sed eligendi nam deleniti et dolore eos et. Aperiam voluptatum ut cum voluptas natus. Consectetur pariatur sunt rerum omnis. Rem velit quia magnam dolores voluptatem et ut aut. Dolorem eligendi cumque laborum aliquid est quisquam et. A ut debitis dolor doloremque. Aut qui dolore et. Facere et doloremque rerum sit facere magni. Et qui quia consequuntur nisi corporis. Nam cupiditate cum sit eos error perspiciatis voluptatum. Sint corporis ipsum est illo laudantium distinctio. Suscipit unde qui suscipit doloribus corrupti pariatur velit optio. Recusandae voluptates iste fugit illum alias assumenda. Exercitationem amet repellendus sed. Aliquid est sunt est illum porro nisi explicabo consequatur. Cum sed cum neque esse voluptatibus adipisci est. Quis voluptate iusto eligendi. Dolor fuga ipsam voluptates alias harum sed sint. Et nemo omnis ea quo. Optio voluptas aut numquam a qui aut ducimus. Dolorem voluptatem porro placeat voluptate culpa. Veritatis ipsum animi quaerat sit. Dolor temporibus sunt aliquam natus. Eveniet velit numquam quis itaque et nemo sunt. Ipsum ipsam laudantium repellendus autem corporis nisi facere est. Fugiat quis debitis ut inventore officiis consectetur est. Et sint aut est omnis soluta at. Et facilis veritatis sint voluptatem quis amet voluptatem. Architecto incidunt enim sit assumenda nam aut harum. Rerum doloribus dignissimos non. Deserunt quas eaque maxime est consequatur rerum quas. Quos commodi ut maiores eligendi. Inventore aliquid quia non molestiae. Reiciendis eius esse temporibus molestiae. Quo blanditiis repellat aut saepe et. Eligendi voluptas voluptatem sed repellat. Quas nisi quaerat asperiores. Earum harum deleniti voluptas facere. Officia omnis impedit repellendus enim architecto. Modi quia incidunt corrupti autem. Tenetur sed omnis vel. Officiis corporis deserunt numquam nihil et quaerat quibusdam. Quod qui non dolorum ut atque expedita necessitatibus. Omnis quia ullam voluptatibus voluptas. Suscipit dolorem saepe facere quaerat ratione. Quisquam in illum consequuntur exercitationem facilis. Distinctio sed ut nemo maiores odio aut ut temporibus. Iste quia corporis est et illo similique dolores. Sed ea est fugiat. Quam possimus aut consequatur saepe dolorem. Et a ut cumque quos ratione atque recusandae nihil. Laborum perspiciatis dolores aut cum ipsum qui voluptas. Voluptatum quia distinctio explicabo aliquam sunt. Minima et deserunt necessitatibus dolorum eius dolore quibusdam ex. Ipsum quia cupiditate qui molestias quidem in veniam. Cum qui consequatur reiciendis esse. Reprehenderit consequatur dolores est qui ut sapiente deleniti. Ipsam rerum in deserunt dolorum cumque.	0.4	388429	["\\/tmp\\/fakerGp75hP"]	2023-05-23 19:56:06	2023-05-23 19:56:06
5	Bertram	Daugherty LLC	Accusantium sit veritatis et commodi neque. Omnis quam et explicabo. Voluptas est in voluptatum non. Ipsam rerum et blanditiis illum molestiae. Qui officia ut velit non qui. Quae non voluptas ea deleniti. Nisi quod voluptatem quia amet odit. Id suscipit sapiente ipsam a unde quia porro. Reprehenderit magnam illo eos exercitationem ut. Occaecati est sint qui et. Quae aut sequi voluptates nemo reiciendis. Neque sunt tenetur esse exercitationem et aut. Consequatur consectetur aut nobis vel beatae assumenda. Officia necessitatibus explicabo et dignissimos reiciendis omnis. Sunt asperiores consectetur saepe aut. Hic laudantium soluta qui minus perferendis non. Totam enim quis et sit sit corrupti nobis. Aliquam aut animi quia est. Aut beatae sit est quis. Veritatis minima autem qui neque. Consequatur ipsam illo sed quia provident rerum. Ipsam ex hic molestias quia iste nulla. Animi ut qui exercitationem ut quia velit. Vel praesentium at consequuntur eum aut laboriosam officiis. Velit id ut dolore voluptatem voluptatum alias soluta dolor. Fuga tempora quibusdam quia. In facilis pariatur tempora et ea dolores voluptas. Et aut voluptatem in saepe. Fuga dolorem delectus libero est voluptatem ea amet. Et illum veritatis eum fugiat qui quo est. Aut nam et eius et distinctio ipsam consequatur.	1.4	199988	["\\/tmp\\/fakerQntAPK"]	2023-05-23 19:56:06	2023-05-23 19:56:06
6	Marianne	Dooley Ltd	Quia libero cum qui quae voluptatum dolores expedita. Quas nemo aspernatur quis saepe. Et inventore magni qui natus qui ut. Occaecati explicabo est voluptatem ut aut. Harum veritatis adipisci minima non consectetur incidunt. Nisi facilis et at et sunt fugiat est in. Ipsam cumque voluptatem odit facere impedit earum. Voluptatem iusto quia adipisci. Fugit assumenda omnis harum eos qui nobis est. Vero ipsam fugiat porro dolorem. Nesciunt tempora sit a quidem asperiores sit. Nihil voluptatem officia ipsum nisi animi et. Occaecati incidunt ipsum quis. Omnis consequatur amet sint. Expedita aperiam qui quia molestiae. Suscipit nisi provident nostrum nihil fugiat debitis deleniti maiores. Dolor ut inventore est. Iste rerum vero ipsam. Ex quia commodi in optio. Nihil ipsam et optio ipsa. Placeat a ad ipsum iusto eos. Qui voluptatem sint sapiente repudiandae et voluptatem necessitatibus. Officiis tenetur expedita ex. Voluptatem sed praesentium ut blanditiis rem accusamus at. Dolores expedita est non dolor assumenda accusantium iste. In quos delectus dolorum similique. Est consequatur quaerat minima molestiae dolorem dolores. Eos iure fugit et nisi consequuntur eligendi iure libero. Earum dolorum velit consequatur. Eos omnis et similique. Aut occaecati ut aut expedita itaque nisi voluptate enim. Consequatur molestiae occaecati amet. Et velit sit minima sint modi. Non cumque atque aut dolorem quis. Dolores et quis vero recusandae vel maxime. Explicabo qui a maiores saepe sapiente eligendi. Praesentium recusandae occaecati veniam illo amet est et et. Eum consequatur quia odio esse voluptatibus non reiciendis. Dolorem quos qui qui quam ut. Molestiae ratione quas doloribus illo quis. Saepe voluptatem tenetur repellendus eum soluta excepturi. In velit porro laboriosam quos. Nihil eum eum earum quaerat non aperiam nobis sapiente. Odio beatae dolorum qui itaque. Animi pariatur blanditiis enim voluptas nam sequi corrupti. Non accusamus sint occaecati ut. Quod tempore eum nulla voluptas voluptatem. Velit sed ratione voluptas quo fugit est voluptas dolores. Esse aut in delectus perferendis.	1.2	325035	["\\/tmp\\/fakerwdY4z8"]	2023-05-23 19:56:06	2023-05-23 19:56:06
7	Judson	Rogahn Group	Illum minima necessitatibus laudantium pariatur et tempore. Quisquam quisquam ipsam eum eum odit. Consequuntur hic sunt libero sed. Harum non enim odit et. Error reiciendis consequatur et ab. Fuga quis tempore qui adipisci. Alias non inventore optio corporis occaecati. Laborum enim repudiandae quaerat aut nemo debitis facilis. Quia explicabo cumque qui asperiores quia quo molestias consequuntur. Quae quaerat qui rerum ut cumque sapiente. Sit asperiores non quod et et placeat eaque. Doloremque laborum dolores adipisci consequatur minima delectus. Sunt numquam accusantium error veniam. Dolor deleniti similique velit odit odio quia qui. Sequi iste ut vero officiis quo quia. Nulla et et adipisci quam est modi ullam. Fuga hic et rerum at. Ullam non vero velit sunt quia. Earum odio esse ipsum praesentium. Similique assumenda repellendus neque veritatis at in ipsum. Illum et cum pariatur dolores laborum est. Atque hic quo saepe ducimus vel. Possimus ut temporibus est quas. Corrupti voluptas suscipit omnis quam sapiente sint molestiae. Quis et libero iste dolor nihil. Iusto odit minus quidem veritatis. Ut numquam aut eaque magni et similique eos occaecati. Et ut omnis eaque. Quis sunt consequatur magnam ratione. Illo maxime minus nihil sed nemo aut. Sed quod dolorem illum neque ad. Quam eum aspernatur nostrum tenetur optio. Nihil quo in rerum a. Facilis molestiae praesentium occaecati beatae debitis eum vel. Nisi sint qui quia error. Culpa velit dolores eos amet tenetur molestias non repudiandae. Officia temporibus nulla voluptate. Consequatur totam ab quas cum ad impedit autem. Ut facilis voluptas eveniet. Eveniet et est ea cumque vero omnis sint. Est ut dolor alias enim architecto. Maxime libero eum voluptatem sed et eos harum. Eveniet cumque accusamus et non. Consectetur cupiditate eos vel iste rerum nihil non. Tempora voluptas explicabo quam unde occaecati et. Quod sed id rerum sed minima. Totam laborum et iusto omnis ea. Dolorum illum et labore et ut consequatur illo. Doloremque sed asperiores consequatur enim possimus ipsa sit. Quasi mollitia exercitationem nisi dolore ipsam. Unde ea tenetur maxime eos pariatur voluptates. Voluptatibus aliquam qui illum aut debitis. Earum quibusdam dolor cupiditate magni expedita sed aspernatur. Incidunt assumenda dolores aut quo. Reiciendis facere reiciendis atque necessitatibus. Minus velit ut eius voluptas vitae sed maxime qui. Facilis sunt rerum quos vitae commodi perferendis. Corporis est odit sint architecto. Excepturi animi natus quis dolore. Aut voluptatem a mollitia facere ea eveniet. Et vel autem voluptas ut consequatur repudiandae. Quo maxime accusantium sapiente dolores et tempora numquam quam. Ut commodi natus minus illo. Corporis facilis quaerat voluptatibus. Qui error quo cupiditate iure quos cumque. Eos aut eligendi asperiores soluta qui voluptate. In officia vitae laborum saepe minima minima velit. Recusandae esse sed eius atque.	2.3	196664	["\\/tmp\\/faker3lNjV4"]	2023-05-23 19:56:06	2023-05-23 19:56:06
8	Shanelle	Swaniawski Inc	Recusandae est vel aut sed magnam. Accusantium laborum autem voluptates id. Voluptatem aut laborum voluptatibus odio debitis. Perspiciatis omnis nihil voluptas. Quos rem velit voluptatem voluptatem nemo assumenda. Incidunt quas magnam beatae sint qui consectetur. Vero quas cum corrupti quae aut dolores. Ratione doloribus ducimus officia quam consequatur. Omnis ducimus dolores accusamus a. Aut ab est voluptas. Dicta quia qui facilis et expedita ut. Et magni ut quaerat laborum. Molestiae aliquid laborum quam maiores. Et quis quisquam qui animi vitae eos. Magni voluptates sit qui molestiae nulla. Dolore autem optio corporis dolor eveniet illum vel. Ut eum id sequi. Eaque totam nihil dolores ipsam. Aut fuga sequi omnis qui. Repudiandae voluptatem sunt accusamus ea reiciendis ut. Quaerat repellat doloremque totam et. Omnis qui odio tempore nam. Ut voluptates eligendi vel distinctio occaecati optio nisi. Ullam eligendi odit repellat tempora. Ipsam necessitatibus eum officia pariatur. At non et consequatur fuga. Cum saepe labore et. Voluptatem quibusdam corrupti ipsam et ipsa. Corrupti sit sit rem et. Aliquam consequatur voluptas explicabo. Exercitationem tenetur reprehenderit vitae laudantium provident. Nostrum repellat placeat sed aut. Iste qui id rerum sed autem. Non quis et eos molestiae dicta. Accusantium quis rem officiis itaque non. Sapiente dolorem nisi ea beatae quia molestias similique. Adipisci in est debitis dolorem aliquid nihil sed. Natus culpa molestiae voluptatem eaque repellat ea natus. Et mollitia consequatur corrupti optio. Illum quis et quasi quisquam quam voluptatem velit totam. Animi quisquam harum sint unde porro sequi iste fugiat. Molestiae quas eos qui qui in sed. Numquam impedit nulla ut modi in. Autem id esse consectetur ea. Et tempora sint assumenda deserunt tempora. Aut illum quis omnis doloremque magnam aspernatur. Quae ut est ullam reprehenderit vel. Sint libero quisquam et voluptatem eius eum. Odio quod ut sunt dolorem voluptatem praesentium qui. Aut a est magni blanditiis nobis asperiores doloribus. Qui ab in dolore adipisci autem. Est explicabo officiis necessitatibus aut earum magni. Placeat explicabo sed doloremque nam qui voluptatem.	0.9	357294	["\\/tmp\\/faker8lnCB8"]	2023-05-23 19:56:06	2023-05-23 19:56:06
9	Annalise	Rodriguez and Sons	Placeat eius dolor expedita. Aperiam consequuntur ipsam non culpa. Excepturi itaque ratione accusantium enim error soluta iusto. Dolor ut vel enim nulla maiores expedita. Minima tenetur vel aperiam tempora. Sunt architecto voluptatibus quasi ea. Quidem aliquid nihil ut quae. Cupiditate ea est sit odio dolores iusto quia. Amet ut sit ipsa est at qui quasi. Eius eum eum libero accusantium quisquam sunt. Velit iusto facere alias ipsa illum et. Eum excepturi odio vero consectetur quaerat quis nihil. Hic sed rem eveniet qui magnam laboriosam. Sed consequatur eligendi totam aut est. Omnis nihil cupiditate et amet incidunt aperiam iste. Voluptas molestias ipsam voluptatem est totam. Sunt tempore quam et dolorem illo deserunt repellendus possimus. Mollitia suscipit iusto illo modi enim sit excepturi. Adipisci iste facere voluptas ut quis saepe. Voluptate eligendi fugit nulla ipsum aliquid ipsam. Deleniti aut quisquam quos reprehenderit. Aspernatur adipisci non tempora ab dicta. Ullam veniam enim mollitia corrupti asperiores. Aut voluptatem sit voluptas commodi quia. Beatae illum placeat iusto ut est nam. Impedit sit pariatur consectetur voluptatibus aspernatur unde iusto. Animi officia omnis temporibus rem repellendus et. Ab impedit eos quia impedit. Cumque dolorem qui voluptas ducimus ut consequatur eum laboriosam. Sint et rerum eligendi maxime autem eum. Harum voluptatum praesentium magnam aut sequi. Quos sapiente tempora hic ad commodi ratione. Sed eius optio sint alias eligendi. Natus aut nihil autem atque natus ut autem. Nulla voluptatem eum consequatur ullam natus alias. Laborum hic molestiae ea repellat voluptate. Ipsam impedit quis omnis. Eveniet aut minima in repellendus. Consequatur est vitae et voluptatem. Modi eligendi expedita facere sit enim. Expedita odio et quia nulla adipisci laborum. Magnam et officiis nisi tempora. Eos maiores asperiores velit provident nam blanditiis. Provident praesentium et minima repellendus odit atque voluptas. Autem commodi sit nihil dolore in accusantium. Voluptatem sit quae qui aspernatur tenetur eum. Nam fugit ad sit neque voluptatem. Voluptatem amet rem aperiam aut aut omnis sed. Ipsum at fugiat saepe sunt placeat. Error ut quibusdam voluptatibus inventore. Quasi perferendis ratione commodi quas at autem consequuntur. Magnam autem ab consequatur omnis sunt. Quasi est facere officiis quidem natus aut velit ipsam. Ab consequatur eos cum deleniti. Laborum odit distinctio molestiae quis quibusdam blanditiis soluta enim. Fugiat vel aut possimus et aut sunt. Ipsum aut assumenda alias recusandae ullam. Placeat sed assumenda consequatur qui quo veniam. Explicabo eveniet beatae et voluptatibus recusandae. Earum est consequatur qui et corporis beatae. Sequi temporibus assumenda aliquid illo esse ea velit culpa. Mollitia fuga est neque reprehenderit commodi qui nemo. Aut amet consequuntur quia ut. Nisi totam non ut nemo consequatur possimus. Dolorem magni iste esse autem odio consequuntur voluptatibus. Occaecati sequi iusto ratione sit sed velit eveniet. Et totam eligendi illo voluptas rem veniam minus. A sit maiores omnis neque cum consequuntur enim. Dolor unde rerum delectus quod.	4.1	311620	["\\/tmp\\/faker1N3Xyq"]	2023-05-23 19:56:06	2023-05-23 19:56:06
10	Owen	Trantow, Hodkiewicz and Fadel	Et qui quidem quos et. Exercitationem quae itaque velit earum ut atque porro. Tempore totam maxime ullam. Veritatis iusto omnis omnis enim. Doloremque cum maiores nemo vel occaecati cum. Rerum repudiandae qui accusamus repellat. In quaerat voluptas nobis deserunt tempora quo. Qui pariatur tempore aut officiis deserunt impedit ex. Tenetur cum harum non. Nemo cumque quo rerum nam. Quam dolore mollitia sed dolorum id et. Excepturi at maiores libero incidunt qui exercitationem vel officiis. Natus omnis numquam sed molestias soluta illo. Totam odio assumenda vel est aut quisquam nisi. Non temporibus enim iusto quod. Ut dolore rem deleniti praesentium. Cupiditate nulla eos ut ut et. Corrupti blanditiis aut eius adipisci. Voluptatem aspernatur id illo rem adipisci repellendus. Nesciunt quia deleniti porro fugit. Maiores qui enim voluptatem omnis id reprehenderit quod rerum. Enim rerum blanditiis aut deleniti ipsa tempore. Magni sunt sapiente voluptas nesciunt explicabo. Fuga vel quisquam placeat rerum iste rerum. Animi inventore ut fuga nihil facilis sapiente consequatur. Excepturi officiis sunt ad. Minima reiciendis esse minus est. Incidunt reiciendis qui sed quia commodi officiis velit iusto. Aut dolore eligendi consectetur expedita voluptas fugit. Non commodi temporibus at at vero laborum nisi. Necessitatibus qui ut consequatur qui eum. Ut et omnis fugit similique facilis. Aut rerum veritatis rerum. Nam magni enim et est molestiae magnam earum. Recusandae repellendus eos sit odit et rerum beatae. Exercitationem qui nihil ut quod eaque natus. Aut eligendi nemo necessitatibus corporis enim molestiae.	0.3	260378	["\\/tmp\\/fakergG1hD9"]	2023-05-23 19:56:06	2023-05-23 19:56:06
11	Foster	Berge, Mante and Mohr	Omnis inventore necessitatibus enim ut placeat omnis minima rerum. Sunt qui enim in dolorem quia voluptatem. Sint quod perspiciatis sequi aperiam. Aut ipsam minus praesentium. Eos totam dolorem error optio ipsa consequatur quia sed. Sed similique excepturi quis autem doloremque. Aut ipsum quisquam reiciendis voluptates cumque cum. Aut commodi dolor impedit. Ut modi sit quae nesciunt. Dolore odit rerum corrupti et aut eveniet nihil voluptatem. Reprehenderit dignissimos exercitationem nostrum. Quia eos provident nulla non placeat iusto. Sint atque est et corporis sed. Distinctio tenetur et veniam aspernatur praesentium. Iste et omnis sint cum voluptatibus rerum. Saepe ad in ipsam qui adipisci nihil. Eveniet et dolor consequatur earum sunt optio sit non. Iusto maxime consequatur dolores eaque aut cupiditate. Illo numquam architecto necessitatibus dolores sit et. Sed dignissimos voluptatem nihil nihil. Quos sunt est voluptas beatae sint dolorem culpa. Iste repellendus eum illum quis rerum. Dolor amet fugiat et distinctio. Odio perferendis ipsa voluptatem. Rerum qui dolorem dolorem enim fugit ipsam architecto. Sunt sapiente et et mollitia blanditiis repudiandae ea. Eum aut tempore itaque numquam. Ipsum quod consectetur placeat dolorem. Porro hic officia harum ut impedit impedit reiciendis. Eos nobis aut amet a omnis. Sint quia et assumenda blanditiis quaerat. Vero delectus repellendus ut voluptate est et rerum et. Provident omnis iure sed totam quam. Dolores accusamus qui qui dolorem aut distinctio aspernatur. Enim libero quos amet pariatur est fuga saepe dolore. Corporis sit molestiae sed aliquam minima. Voluptatem sed natus et. Beatae at sequi commodi nulla qui optio. Quo rerum rerum laborum et et. Est earum dolorem id exercitationem ut. Est aut quisquam doloribus et eaque minus eos. Reprehenderit aspernatur fugit voluptatum est qui perferendis. Veritatis perspiciatis omnis ipsum itaque quis quia.	0	293091	["\\/tmp\\/fakerz7tnbY"]	2023-05-23 19:56:06	2023-05-23 19:56:06
12	Sunny	Schmidt, Deckow and Ankunding	Quis unde iusto aperiam dolores. Est porro voluptatibus accusamus sed recusandae. Non rerum sequi quibusdam quasi. Ipsa quo odio aliquid atque. Possimus provident quibusdam maiores. Quisquam sit consequatur omnis voluptas quibusdam et quibusdam perspiciatis. Animi consequatur dolor dolorum in aut. Earum vel voluptates quae temporibus nihil optio. Aperiam delectus doloribus excepturi et. Vero veniam laboriosam aut cupiditate quis vel voluptates. Ut maxime consequuntur soluta eveniet. Incidunt quaerat odio nesciunt aut ducimus amet. Ipsa in aut non. Qui quo nesciunt necessitatibus adipisci nam ducimus quibusdam. Adipisci quod ut et dolor et ad ad. Qui nisi dolore cumque quas culpa eos velit. Cupiditate quo illo eaque omnis accusamus maxime. Accusamus quas maiores impedit omnis. Facere beatae itaque et dolore aut rerum nostrum. Sunt accusantium vero blanditiis. Aut dolorem sed perspiciatis quia ea sed. Cum voluptatem accusamus nobis in fugit in atque. Omnis qui quas et qui excepturi repellendus. Expedita atque qui mollitia illo molestiae consequuntur autem. Officiis esse velit eum laudantium cum odio illo. Quo alias ut eos in. Et veritatis dolorem quo et qui inventore. Quasi libero est debitis vitae nihil saepe quod. Illum est non laborum assumenda. Optio sequi tempore quidem iste non. Inventore quia ex et earum ducimus sunt nulla.	3.3	365634	["\\/tmp\\/fakeratBmCb"]	2023-05-23 19:56:06	2023-05-23 19:56:06
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_name, phone_number) FROM stdin;
3	Rico	riconaxxbze@gmail.com	\N	$2y$10$6.GamY5uY7g2tha3u0iykOvzvee0bHIKUL2lgntgYpG7ELSj9eHq6	\N	2023-05-23 20:23:55	2023-05-23 20:23:55	Gunawan	082219458427
5	Rico	riconaxxbza@gmail.com	\N	$2y$10$NHqZyyl2XHQUa2zCugI.m.6GP2MaLEslJp2HLBCxGi0cT6.E4WaM.	\N	2023-05-23 20:44:02	2023-05-23 20:44:02	Gunawan	082219458427
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- PostgreSQL database dump complete
--

