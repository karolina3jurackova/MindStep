import 'package:adv_basics/models/app_task.dart';

const List<AppTask> habitTasks = [
  // ── TASK 01 ──────────────────────────────────────────────────
  AppTask(
    id: 'rano-bez-mobilu',
    name: 'Ráno bez mobilu',
    description:
        'Prvních 30 minut po probuzení neber telefon do ruky. Získáš jasnější mysl, méně stresu a lepší soustředění na zbytek dne.',
    durationMinutes: 30,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Mozek přechází při probuzení z klidového do bdělého stavu. Prvních 30 minut je výjimečně cenné – mozek je v přirozeném stavu bez reaktivního myšlení.',
      'Samotná přítomnost telefonu v dosahu – i vypnutého – snižuje kognitivní kapacitu. Mozek vynakládá energii na potlačování touhy sáhnout po telefonu.',
      // Day 2
      'Studie v Journal of Behavioral Addictions: kontrola telefonu ihned po probuzení koreluje s vyšší hladinou kortizolu po celé dopoledne.',
      'Mozek se přepne do reaktivního módu a začne reagovat na podněty druhých lidí místo stanovení vlastního denního záměru.',
      // Day 3
      'Průměrný člověk kontroluje telefon 96× denně, první kontrola přichází průměrně 7 minut po probuzení.',
      'Mozek v prvních 30 minutách po probuzení přechází z theta vln (hluboký odpočinek) do alfa vln (relaxovaná bdělost) – telefon toto okno okamžitě přeskočí do beta vln (stres).',
      // Day 4
      'Telefon jako první věc ráno zvyšuje hladinu kortizolu – stresového hormonu – a spouští úzkostný vzorec myšlení přetrvávající celé dopoledne.',
      'James Clear: „Pokud začneš reaktivně, posíláš mozku signál: Jsem typ člověka, který reaguje na druhé."',
      // Day 5
      'Šimpanzí studie ukázaly, že i zvířata se raději řídí zvyky skupiny než vlastním úsudkem. Ráno bez mobilu tě vědomě vyčleňuje z kolektivního reflexu.',
      'Pokud začneš proaktivně – tichem, pohybem nebo záměrem – posíláš mozku jiný signál: „Jsem typ člověka, který řídí svůj den."',
      // Day 6
      'Noc před tím dej telefon mimo dosah postele – do jiné místnosti nebo aspoň na druhý konec pokoje. Fyzická vzdálenost přerušuje ranní automatismus.',
      'Nahraď telefon konkrétní rutinou: sklenicí vody, protažením, deníkem nebo jen tichem. Každá volba je lepší než scrollování.',
      // Day 7
      'Pokud používáš telefon jako budík, pořiď si klasický budík. Jeden krok navíc, ale ranní mysl ti za to poděkuje.',
      'Clear: „Nestačí jen odolávat pokušení – musíte odstraňovat podněty, které pokušení vyvolávají." Telefon ráno na stolku je podnět.',
      // Day 8
      'Výzkum z Texaské univerzity (2017): samotná přítomnost telefonu v dosahu snižuje kognitivní kapacitu, i když je vypnutý a obrazovka dolů.',
      'Zkus rozšířit bez-telefonní čas na 45 minut. Každý den o trochu víc – to je princip 1% zlepšení.',
      // Day 9
      'Sděl svůj záměr někomu blízkému: „Ráno nepoužívám telefon prvních 30 minut." Sociální závazek prokazatelně zvyšuje úspěšnost.',
      'Ranní čas bez telefonu je investice do sebe – ne oběť. Každé proaktivní ráno tě formuje jako člověka, který si sám určuje začátek dne.',
      // Day 10
      'Po 10 dnech bez ranního telefonu se proaktivní ráno stává novou normou. Tvůj mozek si zvykl začínat ze sebe, ne z notifikací.',
      'James Clear o vlastní zkušenosti: „Nechával jsem telefon v jiné místnosti. Výsledek: první 3–4 hodiny dne jsem měl navíc pro hlubokou práci."',
    ],
    tips: [
      'Noc před tím přesuň telefon do jiné místnosti nebo alespoň na druhý konec pokoje.',
      'Pořiď si klasický budík – nejčastější výmluva je „potřebuji telefon jako budík".',
      'Prvních 30 minut nahraď konkrétní rutinou: sklenice vody, protažení, deník, ticho nebo procházka bez obrazovky.',
      'Pokud se přistihnete, že sáhnete po telefonu automaticky, řekněte si nahlas: „Sahám po telefonu, i když jsem si slíbil, že to neudělám." Tato verbalizace přeruší automatismus.',
    ],
  ),

  // ── TASK 02 ──────────────────────────────────────────────────
  AppTask(
    id: 'skorkarta-navyku',
    name: 'Odhal své návyky',
    description:
        'Spiš si všechny své každodenní návyky a ohodnoť je. Za 10 dní získáš přesný přehled o tom, co ti prospívá a co tě brzdí.',
    durationMinutes: 15,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Návyky jsou ze své podstaty neviditelné. Zopakujeme-li je tisíckrát, přestanou nám přicházet ke vědomí – dobré i špatné.',
      'Výzkumy ukazují, že samotné vědomé sledování vlastního chování – bez jakékoli jiné intervence – vede ke změně.',
      // Day 2
      'Japonské dráhy: „Ukaž a řekni" – strojvůdci nahlas pojmenují každou akci. Počet chyb klesl o 85 %, nehod o 30 %. Vědomost mění chování.',
      'Lidé, kteří si zapisovali jídelníček, zhubli výrazně více než ti, kteří ne – bez jediné změny v tom, co jedli.',
      // Day 3
      'Clear cituje prodavačku, která automaticky přestřihla zákazníkovu debetní kartu – stejně jako dělala s vyčerpanými dárkovými kartami. Automatismus přestane vnímat kontext.',
      'Jak na to: Spiš vše, co děláš od rána do večera – každou rutinu, bez hodnocení. Popisuj, nehodnoť.',
      // Day 4
      'Ke každé položce přiřaď znaménko: + (prospěšný), – (škodlivý), = (neutrální). Nehodnoť hned – nejdřív jen popiš.',
      'Klíčová otázka: „Pomáhá mi tento návyk stát se člověkem, jímž chci být – nebo mě od toho vzdaluje?"',
      // Day 5
      'Hodnoť se studenou hlavou – ideálně druhý den. Odstup zvyšuje přesnost hodnocení a snižuje sebekritiku.',
      'Benjamin Franklin nosil od svých dvaceti let zápisník, kde sledoval třináct osobních ctností – každý večer si zaznamenal, jak si vedl.',
      // Day 6
      'Skórkarta odhalí vzorce, které jinak nejsou viditelné – například jak ranní rutina ovlivňuje zbytek dne.',
      'Clear: „Žádné dobré nebo špatné návyky neexistují. Jsou pouze efektivní návyky – hodnotíš pragmaticky: slouží mi to v dlouhodobém horizontu?"',
      // Day 7
      'Co dokážeš pojmenovat, dokážeš ovlivnit. Viditelnost je první a nejdůležitější krok ke změně.',
      'Podívej se na svá + hodnocení. Jsou tyto návyky opravdu ve tvém každodenním životě, nebo se jim nedostává dost prostoru?',
      // Day 8
      'Vyber jeden – návyk ze svého seznamu. Zamysli se: Čím ho nahradit nebo jak ho zredukovat? Co konkrétně uděláš?',
      'Sdílej svůj seznam s někým, komu důvěřuješ. Pohled zvenčí odhalí vzorce, které sám nevidíš.',
      // Day 9
      'Přepiš svůj seznam po týdnu. Co se změnilo? Samotné vědomí návyků je mění.',
      'Skórkarta není o sebekritice. Je o sebepoznání. Přistupuj k ní jako pozorovatel, ne jako soudce.',
      // Day 10
      'Klíčová otázka pro budoucnost: Které 3 návyky by největší měrou posunuly tvůj život, kdyby ses jich držel každý den?',
      'Co dokážeš vidět, dokážeš změnit. Za 10 dní jsi udělal první a nejtěžší krok – stal ses pozorovatelem vlastního života.',
    ],
    tips: [
      'Nepřeskakuj neutrální návyky – i „osprchovat se" nebo „uvařit čaj" má místo na seznamu. Tyto kotvy jsou klíčem pro kumulaci návyků.',
      'Pokud váháš, jak klasifikovat návyk, použij Clearův test: „Je to hlas pro mou vytouženou identitu, nebo proti ní?"',
      'Skórkarta není o sebekritice. Je o sebepoznání. Přistupuj k ní jako pozorovatel, ne jako soudce.',
      'Po 10 dnech se vrať k seznamu: co se změnilo? Jinak hodnotíš některé návyky? To je důkaz, že vědomí pracuje.',
    ],
  ),

  // ── TASK 03 ──────────────────────────────────────────────────
  AppTask(
    id: 'pravidlo-dvou-minut',
    name: 'Pravidlo dvou minut',
    description:
        'Vyber si jeden návyk, který odkládáš, a zredukuj ho na verzi, která trvá jen 2 minuty. Překonáš prokrastinaci a začneš jednat.',
    durationMinutes: 2,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Nejsložitější část každého návyku není vydržet ani ho dokonale provést – ale fyzicky začít.',
      'Mozek v klidovém stavu má přirozený odpor ke změně. Pravidlo 2 minut tento odpor obchází: zmenši návyk tak, že začít je téměř nemožné odmítnout.',
      // Day 2
      '„Chci číst každý den" → „Každý den si přečtu jednu stránku." Jedna stránka otevírá dveře dalším.',
      '„Chci meditovat" → „Každý den se posadím a zavřu oči na 2 minuty." Sednutí je 80 % celé meditace.',
      // Day 3
      '„Chci cvičit" → „Každý den si obuji sportovní boty." Obuté boty jsou závazek tělu.',
      '„Chci psát deník" → „Každý den napíšu jednu větu." Jedna věta otevírá myšlenky k celé stránce.',
      // Day 4
      'Zeigarnikův efekt: naše mysl přirozeně tíhne k dokončení toho, co začala. Stačí jen začít.',
      'Efekt zahájení: jakmile zahájíme úkon, pravděpodobnost jeho dokončení výrazně stoupá.',
      // Day 5
      'Jeden čtenář Jamese Cleara zhubl 25 kg díky pravidlu: do posilovny každý den, ale max. 5 minut. Za pár týdnů začal přirozeně zůstávat déle.',
      'Cílem není dělat návyk jen 2 minuty. Cílem je překonat startovací bariéru. Jakmile jsi v pohybu, mozek přirozeně pokračuje dál.',
      // Day 6
      'Každý 2minutový start je hlasování pro svou identitu: „Jsem typ člověka, který to dělá."',
      'Nikdy nevynechat dvakrát za sebou: jeden výpadek je náhoda, dva jsou začátek nového (špatného) návyku.',
      // Day 7
      '„Chci se zdravě stravovat" → „Každý den přidám k jídlu jednu porci zeleniny." Malá věc, velký signál pro mozek.',
      'Vůle je omezený zdroj, který se v průběhu dne vyčerpává. Čím méně energie vyžaduje začátek návyku, tím více ti zbyde na zbytek dne.',
      // Day 8
      'Clear cituje choreografku Twyla Tharpovou: „Rituálem není cvičení – je to ten taxík." Dvě minuty stačí k aktivaci celého systému.',
      'Japonský termín kaizen (改善) znamená „neustálé malé zlepšování". Filozofie, která způsobila revoluci v japonské výrobě, stojí na přesně tomto principu.',
      // Day 9
      'Zkus to z opačného konce: začni plnohodnotně, ale po přesně 2 minutách přestaň. Mozek si začne říkat: „To bylo krátké, mohli jsme pokračovat."',
      'Pravidlo dvou minut se hodí zejména v dnech, kdy se ti nic nechce. Profesionál pracuje, i když ho to nebaví – ale začít je snazší s dvěma minutami.',
      // Day 10
      'Pojmenuj si svou identitu: „Jsem typ člověka, který každý den [tvůj návyk]." Opakuj si to každé ráno.',
      'Přidej k návyku odměnu. Co příjemného uděláš hned po splnění? Mozek si toto propojení zapamatuje.',
      // Day 11
      '14 dní malých začátků formuje identitu silněji než jeden heroický pokus. Mozek si zaznamenává vzorec, ne výjimku.',
      'Sdílej svůj 2minutový návyk s někým. Výsledky? Sdílení identity posiluje závazek.',
      // Day 12
      'Každé splnění je důkaz, že jsi ten typ člověka, za kterého se chceš považovat. Identita se buduje důkazy, ne záměry.',
      'Pravidlo dvou minut neznamená být průměrný – znamená být důsledný. Důslednost poráží intenzitu vždy.',
      // Day 13
      '„Chci se učit jazyk" → „Každý den otevřu aplikaci." Otevřená aplikace = závazek mozku pokračovat.',
      'Mistr začínal jako začátečník, který nikdy nepřestal začínat. 2 minuty denně mění návyk v identitu.',
      // Day 14
      '14 dní 2minutového návyku. Každé splnění bylo hlasování pro tvou novou identitu. Jaký člověk jsi se stal?',
      'Dobrý návyk existuje. Teď ho buduješ dál – ne proto, že musíš, ale proto, že jsi typ člověka, který to dělá.',
    ],
    tips: [
      'Cílem není zůstat věčně u 2 minut. Cílem je začít. Jakmile jsi v pohybu, přirozeně pokračuješ dál.',
      'Zkus to z opačného konce: začni plnohodnotně, ale po přesně 2 minutách přestaň. Mozek si začne říkat: „To bylo krátké, mohli jsme pokračovat."',
      'Pravidlo dvou minut se hodí zejména v dnech, kdy se ti nic nechce. Profesionál pracuje, i když ho to nebaví – ale začít je snazší s dvěma minutami než s hodinou.',
      'Nikdy nevynechat dvakrát za sebou. Jeden výpadek je náhoda, dva jsou začátek nového (špatného) návyku.',
    ],
  ),

  // ── TASK 04 ──────────────────────────────────────────────────
  AppTask(
    id: 'implementacni-zamer',
    name: 'Implementační záměr',
    description:
        'Naplánuj si jeden návyk na konkrétní čas a místo. Studie ukazují, že lidé s konkrétním plánem dodržují návyky 2× až 3× častěji.',
    durationMinutes: 5,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Většina lidí čeká na „správný moment", který nikdy nepřijde. Konkrétní plán správný moment vytváří sám.',
      'Britští vědci: skupina s konkrétním plánem cvičila ve 91 % případů vs. 35 % bez plánu. Téměř 3× více.',
      // Day 2
      'Věta implementačního záměru: „Budu [ČINNOST] v [ČAS] v [MÍSTO]." Tři informace eliminují tisíc rozhodnutí.',
      '„Budu meditovat 5 minut v 7:00 v kuchyni." Konkrétní záměr přeměňuje vágní přání na pevnou dohodu se sebou.',
      // Day 3
      '„Budu číst 15 minut v 21:30 v posteli." Čas + místo = automatický spouštěč bez potřeby vůle.',
      'Čím méně rozhodnutí musíš v průběhu dne dělat, tím více energie máš na samotný návyk.',
      // Day 4
      'Konkrétní plán eliminuje potřebu motivace v daný moment – rozhodnutí je již přijato předem.',
      'Profesor Peter Gollwitzer zkoumal implementační záměry po desítky let: zvyšují pravděpodobnost dodržení cíle o 20–300 %.',
      // Day 5
      'Britská vláda zvýšila počet daňových přiznání přidáním políčka: „Zapište datum a čas, kdy vyplníte přiznání." Konkrétní ukotvení funguje.',
      'Doplň záměr o záložní plán: „Pokud v 7:00 nestihnu, medituju v 12:00 při obědě."',
      // Day 6
      'Volební účast stoupá, když se voličů předem ptají: „Kde je vaše volební místnost? Kdy tam půjdete?" Konkrétní odpovědi zvyšují pravděpodobnost činu.',
      'Přezkoumej svůj záměr: Je čas realistický? Je místo dostupné každý den? Je délka zvládnutelná i ve špatný den?',
      // Day 7
      'Implementační záměr funguje i při odolávání pokušením: „Pokud nastane X, zareaguji způsobem Y." Předem formulovaná reakce poráží vůli v daný moment.',
      'Sdílej svůj záměr s někým blízkým. Řekni jim přesně: co, kdy a kde. Sociální závazek 2× zvyšuje plnění.',
      // Day 8
      'Reflexe: Který čas dne ti nejlépe funguje pro důležité návyky? Ráno, polední pauza, nebo večer?',
      'Mít záměr bez konkrétního plánu je přání. Záměr s časem a místem je rozhodnutí. Rozhodnutí plníme.',
      // Day 9
      'Přidej druhý implementační záměr pro jiný návyk. Stejná struktura: co, kdy, kde. Systém se znásobuje.',
      'Clear: „Lidé si mnohdy myslí, že jim schází motivace, jenže ve skutečnosti postrádají především preciznost. Bez jasného plánu není vždy zřejmé, kdy a kde přikročit k činu."',
      // Day 10
      '10 dní s implementačním záměrem. Který návyk se stal nejspolehlivějším? Proč? Zapiš si závěr pro budoucnost.',
      'Konkrétní plán je forma respektu k sobě samému. Říkáš si: „Tohle je dost důležité, aby mělo svůj čas a místo."',
    ],
    tips: [
      'Čas a místo musejí být konkrétní a realistické – „ráno" nestačí, „v 7:00 v kuchyni" funguje.',
      'Pokud nevíš, kdy začít, zkus první den v týdnu nebo měsíci. Lidé jsou v těchto dnech optimističtější a mají větší motivaci začít nové věci.',
      'Kombinuj s kumulací návyků: „Po [stávající návyk] udělám [nový návyk]." Tak nevytváříš nový čas – přidáváš nový krok k existujícímu.',
      'Doplň záložní plán: „Pokud nastane překážka, udělám alternativu." Flexibilita zvyšuje úspěšnost.',
    ],
  ),

  // ── TASK 05 ──────────────────────────────────────────────────
  AppTask(
    id: 'kumulace-navyku',
    name: 'Kumulace návyků',
    description:
        'Připoj nový návyk k tomu, který už každý den automaticky děláš. Je to nejpřirozenější způsob, jak nový návyk usadit do života.',
    durationMinutes: 10,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Každý úkon, který děláš, je zároveň podnět pro ten následující – kumulace návyků to využívá záměrně.',
      'Vzorec: „Po [STÁVAJÍCÍ NÁVYK] udělám [NOVÝ NÁVYK]." Jednoduchý, ale výjimečně účinný.',
      // Day 2
      '„Po ranní kávě si napíšu 3 věci, za které jsem vděčný." Káva se stává spouštěčem vděčnosti.',
      '„Po příchodu domů si okamžitě vyměním oblečení za sportovní." Přechod domu = signál pro pohyb.',
      // Day 3
      '„Po večeři si přečtu 10 stránek knihy." Jídlo jako přirozená brána ke čtení.',
      '„Po čištění zubů se 2 minuty protáhnu." Nejspolehlivější spouštěč – zuby čistíme každý den bez výjimky.',
      // Day 4
      'B. J. Fogg ze Stanfordské univerzity: metoda „Tiny Habits" – jedna z nejúčinnějších metod budování návyků vůbec.',
      'Mozek si zvykne: po A automaticky přichází B. Čím pevnější propojení, tím méně vůle potřebuješ.',
      // Day 5
      'Klíč: spouštěč musí mít stejnou frekvenci jako nový návyk. Každodenní návyk potřebuje každodenní spouštěč.',
      'Diderotův efekt: filosof Denis Diderot dostal elegantní plášť a okamžitě pocítil nutnost upgradu veškerého ostatního majetku. Jeden úkon spouští řetěz dalších.',
      // Day 6
      'Řetěz návyků: A → B → C. Ráno se může stát sekvencí silných rituálů propojených do plynulého celku.',
      'Pokud spouštěč selže (cestování, nemoc), nový návyk selže taky. Měj záložní spouštěč pro výjimky.',
      // Day 7
      'Kumulace funguje i pro přerušení zlozvyků: „Po otevření Instagramu ho zavřu a udělám 5 dřepů."',
      'Prověř: Dochází ke kumulaci spolehlivě každý den? Pokud ne, zkus jiný spouštěč – konkrétnější a okamžitější.',
      // Day 8
      'Clear popisoval svůj neúspěch: „Kliky po obědě" bylo příliš vágní – před, nebo po? Změnil na „jakmile zavřu notebook, udělám 10 kliků vedle stolu." Specifičnost rozhoduje.',
      'Sdílej svůj řetěz návyků s někým. Slyšet ho nahlas pomáhá pochopit, zda je realistický.',
      // Day 9
      'Přidej třetí propojení. Každý nový článek v řetězu je méně tření pro budoucí návyk.',
      'Reflexe: Který ze tvých spouštěčů funguje nejspolehlivěji? Proč? Analyzuj a ber z toho ponaučení.',
      // Day 10
      'Sdělení pro mozek: Každé propojení, které dodržíš, posiluje neurální dráhu. Čím víckrát, tím automatičtěji.',
      'Výzkumy v neuroplasticitě: mozek přirozeně propojuje neurony, které se aktivují ve stejný čas. A → B se stane automatickým, čím více opakování.',
      // Day 11
      'Čím specifičtější a okamžitější je spouštěč, tím lépe. Nikoli „po ránu", ale „jakmile zavřu ledničku po snídani".',
      'Kumulace je nejpřirozenější způsob, jak nový návyk „přilepíš" k životu bez nutnosti vytvářet nový čas.',
      // Day 12
      '''Clear: „Nikoli ‚budu číst každý den', ale ,po večeři si přečtu jednu stránku'." Spouštěč z existující rutiny nese nový návyk zadarmo.''',
      'Tvůj den je řetěz – každý článek spouští další. Navrhni ho záměrně, ne náhodně.',
      // Day 13
      '„Po každém telefonátu napíšu jednu poznámku, co z hovoru vyplynulo." Pracovní kumulace zvyšuje produktivitu bez extra úsilí.',
      'Pokud přidáváš nový návyk, nejdříve se zeptej: „Co každý den dělám spolehlivě?" To je tvůj spouštěč.',
      // Day 14
      '14 dní kumulace. Kolik propojení jsi vybudoval? Tvůj den má teď více záměrné struktury než před 2 týdny.',
      'Každé propojení, které přetrvalo 14 dní, je začátek trvalého rituálu. Gratulace – tyto spouštěče nyní pracují za tebe.',
    ],
    tips: [
      'Nejdříve si vytvoř seznam stávajících návyků. Z nich pak vybírej spouštěče pro nové návyky.',
      'Čím specifičtější a okamžitější je spouštěč, tím lépe. Nikoli „po ránu", ale „jakmile zavřu ledničku po snídani".',
      'Sady kumulací lze řetězit: po A → B, po B → C. Tak vznikají rituály, které vedou přirozeně od jedné aktivity k druhé.',
      'Nový návyk musí mít stejnou frekvenci jako spouštěcí návyk. Každodenní cíl potřebuje každodenní spouštěč.',
    ],
  ),

  // ── TASK 06 ──────────────────────────────────────────────────
  AppTask(
    id: 'uprav-prostredi',
    name: 'Uprav své prostředí',
    description:
        'Přesuň jeden předmět tak, aby tě připomínal k dobrému návyku. Prostředí formuje chování silněji než vůle.',
    durationMinutes: 10,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Anne Thorndikeová přesunula lahve s vodou v nemocniční jídelně. Prodej vody vzrostl o 26 % – bez motivačních kampaní ani cenových změn.',
      'Z 11 milionů senzorických receptorů v těle je 10 milionů zaměřeno na zrak. Co vidíme, to chceme dělat.',
      // Day 2
      'Chceš víc číst? Dej knihu na polštář nebo noční stolek – ne do poličky. Viditelná kniha = přečtená kniha.',
      'Chceš cvičit? Polož sportovní oblečení večer na viditelné místo. Ráno uvidíš záměr, ne rozhodnutí.',
      // Day 3
      'Chceš brát vitamíny? Postav lahvičku vedle kávovaru. Každé ráno ji uvidíš – a vezmeš.',
      'Na letišti Schiphol nalepili obrázek hmyzu do pisoárů. Náklady na čištění klesly o 8 %. Vizuální podnět funguje bez slov.',
      // Day 4
      'Chceš pít víc vody? Postav sklenici nebo láhev přímo na pracovní stůl – ne do kuchyně.',
      'Chceš hrát na kytaru? Vytáhni ji ze skříně a postav doprostřed pokoje. Schovaný nástroj = mrtvý návyk.',
      // Day 5
      'Prostředí formuje chování silněji než vůle. Chytrý design prostředí = méně spoléhání na motivaci.',
      'Kurt Lewin formuloval v roce 1936: Chování = funkce Osoby v jejím Prostředí. To, co děláte, závisí nejen na tom, kým jste, ale kde jste.',
      // Day 6
      'Přesuň jeden předmět a změníš své chování. Žádná vůle – jen architektura voleb.',
      'Princip „jeden kontext, jeden účel": pracovní stůl je pro práci, postel je pro spánek. Míchání kontextů oslabuje každou aktivitu.',
      // Day 7
      'Výzkumy spánkových návyků: lidé, kteří používají postel výhradně ke spaní, usínají výrazně rychleji. Mozek si prostor asociuje s aktivitou.',
      'Zkontroluj: Splnil viditelný předmět svůj účel? Udělal jsi návyk, protože jsi ho viděl? Zaznamenej.',
      // Day 8
      'Clear zavedl zvláštní místnost jen pro práci. Mozek začal automaticky přepínat do pracovního módu při vstupu – a do relaxačního při odchodu.',
      'Přidej druhý předmět. Jaký druhý návyk chceš posílit? Co by tě k němu viditelně připomínalo?',
      // Day 9
      'Produkty, které nejsnáze vedou ke vzniku návyků, mají jedno společné: odstraňují tření. Každý krok navíc mezi tebou a dobrým návykem ho dělá méně pravděpodobným.',
      'Prostředí kolem tebe je tvůj neustálý trenér. Každý viditelný cue je tichý tlak správným směrem.',
      // Day 10
      'Reflexe: Které přesunutí předmětu mělo největší vliv? Proč? Drž toto nastavení trvale.',
      'Jsi architektem svého prostředí. To, co vidíš každý den, tě nenápadně formuje. Navrhuj to záměrně.',
    ],
    tips: [
      'Buď návrhářem svého světa, ne jen jeho konzumentem. Každý týden se zeptej: „Je moje prostředí nastaveno tak, aby mé dobré návyky byly nejsnazší volbou?"',
      'Pokud prostředí nemůžeš změnit, zkus jiné prostředí – jiná kavárna, jiné místo v parku. Nové prostředí nemá staré podněty a je snazší v něm začít nový návyk.',
      'Jeden kontext, jeden účel: pracovní stůl je pro práci, postel je pro spánek. Míchání kontextů oslabuje soustředění i odpočinek.',
      'Pro každý dobrý návyk se ptej: „Jak ho mohu udělat viditelným?" Pro každý zlozvyk: „Jak ho mohu udělat neviditelným?"',
    ],
  ),

  // ── TASK 07 ──────────────────────────────────────────────────
  AppTask(
    id: 'odstran-podnety-zlozvyku',
    name: 'Odstraň podněty zlozvyků',
    description:
        'Schováš nebo odstraníš jeden předmět, který spouští tvůj zlozvyk. Sebeovládání není o vůli – je o inteligentním nastavení prostředí.',
    durationMinutes: 5,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Lidé s výjimečným sebeovládáním se od ostatních neliší silnější vůlí – liší se tím, že se méně vystavují pokušením.',
      'Lee Robins: 90 % vojáků závislých na heroinu překonalo závislost po návratu domů – ne díky léčbě, ale změnou prostředí.',
      // Day 2
      'Scrolluješ příliš? Odstraň aplikace z telefonu nebo dej telefon do jiné místnosti při práci.',
      'Jíš příliš nezdravě? Nedávej sladkosti na viditelné místo – co nevidíš, po tom nesáhneš.',
      // Day 3
      'Díváš se příliš na televizi? Po sledování vytáhni zástrčku a dálkový ovladač dej do zásuvky.',
      'Prokrastinuješ na počítači? Zablokuj si rozptylující stránky pomocí aplikace (Freedom, Cold Turkey).',
      // Day 4
      'Jednou se zlozvyku vzdát je snadné. Odolávat mu každý den je vyčerpávající – a nakonec selžeš. Inteligentní strategie: podnět odstranit.',
      'Inteligentní strategie: jedno rozhodnutí dnes (přeuspořádat prostředí) → prostředí pak pracuje za tebe každý den.',
      // Day 5
      'Pokušení je nejsnazší překonat dříve, než se objeví – ne v momentě, kdy stojíš před lednicí nebo telefonem.',
      'Tření (friction): čím více kroků musíš udělat pro zlozvyk, tím méně ho budeš dělat. Přidej tření záměrně.',
      // Day 6
      'Přidej tření k zlozvykům: odhlásit se z účtu, dát telefon do jiné místnosti, přesunout sladkosti do skříně.',
      'Odebrání podnětu neeliminuje touhu – ale odstraní spouštěč, který touhu aktivuje. Bez spouštěče touha neroste.',
      // Day 7
      'Proveď audit: Kde se zlozvyk nejčastěji spouští? Co vidíš, slyšíš nebo cítíš těsně před ním? Podnět je tam.',
      'Neodolávej pokušení. Odstraň ho. Nejsilnější nástroj sebeovládání je chytré nastavení prostředí – ne silná vůle.',
      // Day 8
      'Vědcům stačilo ukázat drogově závislým snímek kokainu na pouhých 33 milisekund a systém odměny reagoval. Podvědomé podněty ovlivňují chování.',
      'Druhý zlozvyk: Identifikuj ho. Kde je jeho podnět? Co dnes uděláš, aby byl méně dostupný?',
      // Day 9
      'Zlozvyky jsou autokatalytické – živí samy sebe. Cítíš se špatně → sáhneš po nezdravém jídle → cítíš se hůř → sáhneš znovu. Přerušit smyčku je snazší odstraněním podnětu.',
      'Pamatuj: Cílem není odolávat pokušení – cílem je odstranit spouštěč. Odolávání vyčerpává, odstranění osvobozuje.',
      // Day 10
      'Asociace přežívají dekády: žena, která přestala kouřit, po dvaceti letech nasedla na koně – a okamžitě dostala chuť na cigaretu. Kouřila vždy při jízdě. Proto je lepší nepodněty nevidět.',
      'Přidej tření: K čemu musíš udělat navíc 3 kroky, aby ses ke zlozvyku dostal? Přidej tyto kroky fyzicky.',
      // Day 11
      'Sdílej s někým jeden zlozvyk a co jsi udělal pro jeho eliminaci. Vědomí + závazek = silnější efekt na chování.',
      'Kontrola prostředí: Proveď rychlý scan svého bytu nebo pokoje. Kolik podnětů zlozvyků stále vidíš?',
      // Day 12
      'Nahraď: Pro každý odstraněný podnět zlozvyku postav podnět dobrého návyku. Prostředí pracuje oběma směry.',
      'Výzkumy: drogově závislí vracející se do stejného prostředí mají 90% míru relapsu. Vojáci bez starých podnětů – 5–12 %. Prostředí je silnější než vůle.',
      // Day 13
      'Clear ve vlastním životě nechával telefon v jiné místnosti při psaní: „Ráno mám 3–4 hodiny navíc pro hlubokou práci. Nestačilo mít pevnou vůli. Stačilo telefon odnést."',
      'Sebeovládání je krátkodobá strategie. Nastav prostředí jednou – a pak ono pracuje za tebe každý den.',
      // Day 14
      '2 týdny s upraveným prostředím. Které zlozvyky zeslábly? Které zůstávají silné? Pokud zůstávají, podnět je stále přítomen.',
      'Clear: „Podněty vašich dobrých návyků musejí být nápadné. Podněty vašich zlozvyků musejí být neviditelné." Toto je základ chytrého prostředí.',
    ],
    tips: [
      'Sebeovládání je krátkodobá strategie. Opakovaně odolávat tomu samému pokušení každý den je vyčerpávající. Lepší strategie: pokušení jednoduše nevidět.',
      'Clear navrhuje: „Podněty vašich dobrých návyků musejí být nápadné. Podněty vašich zlozvyků musejí být neviditelné."',
      'Pro každý odstraněný podnět zlozvyku postav podnět dobrého návyku. Prostředí pracuje oběma směry.',
      'Přidej tření ke zlozvykům: odhlásit se z účtu, dát telefon do jiné místnosti, přesunout sladkosti do skříně. Každý krok navíc snižuje pravděpodobnost zlozvyku.',
    ],
  ),

  // ── TASK 08 ──────────────────────────────────────────────────
  AppTask(
    id: 'zmen-svou-identitu',
    name: 'Změň svou identitu',
    description:
        'Napiš jednu větu, která definuje, kým se chceš stát – ne co chceš dělat. Identita je nejhlubší a nejtrvalejší motivace.',
    durationMinutes: 10,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Cíle přicházejí a odcházejí. Identita zůstává. Nejtrvalejší změna začíná od toho, kým se chceš stát.',
      'Slovo „identita" pochází z latinských výrazů essentitas (být) a identidem (opakovaně). Vaše identita doslova znamená „opakované bytí".',
      // Day 2
      'Studie psychologa Christophera Bryana: lidé dotázáni „Budeš voličem?" volili výrazně častěji než ti, kteří slyšeli „Budeš volit?" – o 11 procentních bodů více.',
      'Místo „Chci uběhnout maraton" → „Jsem typ člověka, který každý den hýbe tělem." Identita přežije cíl.',
      // Day 3
      'Místo „Chci víc číst" → „Jsem čtenář." Čtenáři čtou – je to přirozené, ne povinné.',
      'Místo „Chci méně kouřit" → „Nejsem kuřák." Odmítnutí cigarety potvrzuje identitu, nespoléhá na vůli.',
      // Day 4
      'Každý provedený návyk je hlasování pro svou novou identitu. Nepotřebuješ dokonalost – potřebuješ většinu hlasů.',
      'Nepotřebuješ okamžitě věřit své nové identitě. Důkazy ji budují postupně, hlasování po hlasování.',
      // Day 5
      'Clear popisuje dva lidi nabídnuté cigaretu. „Ne, díky, snažím se přestat" vs. „Ne, díky, já nekouřím." Druhý má novou identitu – odmítnutí je přirozeným výrazem toho, kdo je.',
      'Jak na to: Zvol návyk → napiš větu „Jsem typ člověka, který..." → po každém splnění si to připomeň.',
      // Day 6
      'Identita může být i překážkou: „Jsem lenoch" nebo „Nejsem sportovní typ." Tyto identity blokovaly miliony lidí. Dají se přepsat.',
      'Neotázej se „Jak to udělám?" – ptej se „Kým se chci stát?" Správné chování z toho vyplyne přirozeně.',
      // Day 7
      'Neuropsychologie: mozek aktivně vyhledává konzistenci s vlastním sebeobrazem. Pokud se považuješ za sportovce, mozek ti připomíná jít cvičit. Identita je sebenaplňující proroctví.',
      'Sdílej svou identitu s někým: „Snažím se být typ člověka, který..." Vyslovená identita je pevnější.',
      // Day 8
      'Rozšiř identitu: Přidej druhou větu pro jinou oblast života (zdraví, vztahy, práce, učení).',
      'Identita se mění pomalu. Jeden výpadek tě nedefinuje. Co tě definuje je vzorec – většina hlasů.',
      // Day 9
      'Clear varuje: nepřipínej se příliš pevně k jediné identitě. „Čím pevněji je určitá idea svázána s vaší identitou, tím hůře se přizpůsobujete životu." Identita má být flexibilní.',
      'Na hrstce hlasů pro zlozvyk příliš nesejde. K vítězství nepotřebuješ získat všechny hlasy – pouze většinu.',
      // Day 10
      '10 dní s vědomou identitou. Cítíš se jinak, když přemýšlíš o tom, kým jsi? Zapiš svůj postřeh.',
      'Identita je nejhlubší vrstva motivace. Cíle tě přimějí k činu jednou – identita tě přiměje k činu každý den po zbytek života.',
    ],
    tips: [
      'Ptej se ne „Jak to udělám?", ale „Kým se chci stát?" Správné chování z toho vyplyne přirozeně.',
      'Na hrstce hlasů pro zlozvyk příliš nesejde. K vítězství nepotřebuješ získat všechny hlasy – pouze většinu.',
      'Nepřipínej se příliš pevně k jediné identitě. Čím pevněji je idea svázána s tvojí identitou, tím hůře se přizpůsobuješ životu. Identita má být flexibilní, nikoli křehká.',
      'Po každém splněném návyku si vědomě řekni: „Tohle potvrzuje, kdo jsem." Vědomé propojení buduje identitu rychleji.',
    ],
  ),

  // ── TASK 09 ──────────────────────────────────────────────────
  AppTask(
    id: 'system-misto-cile',
    name: 'Systém místo cíle',
    description:
        'Přeformuluj jeden svůj cíl na systém každodenních kroků. Lidé se zaměřením na systém dosahují výsledků trvaleji.',
    durationMinutes: 15,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Cíl je destinace. Systém je způsob dopravy. Bez systému cíl zůstane jen přáním.',
      'Clear: „Úspěch je výsledkem každodenních návyků, nikoli dramatických proměn, které se vám přihodí jednou za život."',
      // Day 2
      'British Cycling vyhrál Tour de France 5× za 6 let – ne díky lepším cílům, ale systémem 1% zlepšení ve všem.',
      'Místo „Chci napsat knihu" → „Každý den napíšu 200 slov." Systém funguje i bez inspirace a motivace.',
      // Day 3
      'Místo „Chci zhubnout 10 kg" → „Každý den zvolím zdravější variantu jídla a 20 minut se pohybuji."',
      'Místo „Chci být produktivnější" → „Každý den napíšu 3 priority a pracuji v hlubokém soustředění 90 minut."',
      // Day 4
      'Peter Gollwitzer: lidé se systémy jsou výrazně úspěšnější v dosahování dlouhodobých výsledků než ti s pouhými cíli.',
      'Problém cílů: pokud ho nedosáhneš, jsi neúspěšný. Systém tě činí úspěšným každý den, kdy ho dodržíš.',
      // Day 5
      'Cíle jsou dobré pro nastavení směru. Systémy jsou dobré pro skutečný každodenní pokrok.',
      'Systém nezávisí na náladě, motivaci ani inspiraci. Systém funguje i ve špatný den.',
      // Day 6
      'Basketbalový trenér Bill Walsh: „Skóre se o sebe postará samo." Soustřeď se na správný proces a výsledky přijdou přirozeně.',
      'Problém s jojo efektem: mnoho běžců po maratonu přestane trénovat, protože závod skončil. Motivace byla vázána na cíl, ne na systém.',
      // Day 7
      'Japonský výrobní systém kaizen je ukázkovým příkladem systémového myšlení. Japonské televizory v roce 1974 vykazovaly 5× nižší poruchovost než americké – díky systému, ne cílům.',
      'Sdílej svůj systém s někým: Řekni jim přesně, co děláš každý den. Sdílení = závazek = vyšší plnění.',
      // Day 8
      'Identifikuj největší hrozbu pro tvůj systém. Cestování? Práce z domova? Připrav záložní verzi systému pro tyto situace.',
      'Přidej druhý systém pro jinou oblast. Systémy se navzájem posilují – disciplína v jedné oblasti přelévá do druhé.',
      // Day 9
      'Spokojenost není jen na konci – je v samotném procesu. Lidé zaměření na systém zažívají větší každodenní spokojenost.',
      'Sleduj systém, ne výsledky. Vytvoř si jednoduchou tabulku: Splněno/Nesplněno každý den. Sledování samo motivuje.',
      // Day 10
      '10 dní systému. Jak spolehlivě jsi ho dodržoval? Co by ho ještě zjednodušilo nebo zlepšilo pro budoucnost?',
      'Zaměř se na systém. Výsledky přijdou jako vedlejší produkt. Cíl ukazuje cestu, systém tě po ní vede každý den.',
    ],
    tips: [
      'Cíle ti ukazují směr. Systémy ti ukazují cestu. Potřebuješ obojí, ale soustřeď se na cestu.',
      'Pokud chceš lepší výsledky, nezaměřuj se na výsledky. Zaměřuj se na systém, který k výsledkům vede. Zlepšuj vstupy – výstupy se o sebe postarají samy.',
      'Pokud systém nefunguje, je příliš složitý. Zredukuj ho. Dobrý systém je ten, co funguje i ve špatný den.',
      'Sleduj systém, ne výsledky. Vytvoř si jednoduchou tabulku Splněno/Nesplněno každý den. Sledování samo motivuje.',
    ],
  ),

  // ── TASK 10 ──────────────────────────────────────────────────
  AppTask(
    id: 'jedno-procento-denne',
    name: '1 % zlepšení každý den',
    description:
        'Najdi jedno drobné zlepšení, které dnes uděláš. Za rok budeš 37× lepší. Složený úrok platí i v osobním rozvoji.',
    durationMinutes: 10,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      '1,01 na 365. mocninu = 37,78. Denní 1% zlepšení tě za rok přivede na 37× lepší úroveň.',
      '0,99 na 365. mocninu = 0,03. Denní 1% zhoršení tě za rok přivede téměř na nulu. Směr rozhoduje více než rychlost.',
      // Day 2
      'Dave Brailsford nazval tento princip „agregace marginálních přírůstků" – hledal 1% zlepšení úplně ve všem.',
      'Tvar sedla, typ mazacího gelu, způsob mytí rukou závodníků, typ matrace. Dohromady: světová dominance v cyklistice.',
      // Day 3
      'Každý den si polož otázku: „Co je jedna věc, kterou bych mohl dnes udělat o trochu lépe nebo jednodušeji?"',
      'Vstát o 10 minut dříve. Přidat porci zeleniny. Strávit 5 minut méně na sítích. Každé z toho je 1%.',
      // Day 4
      'Bambusový strom roste 5 let pod zemí, buduje kořeny – a pak za 6 týdnů vyroste 30 metrů. Práce se hromadí neviditelně.',
      'Clear nazývá přelomový moment „bod tání ledu": při -1 °C stále nic. Při 0 °C začne tát – přestože skok byl stejný. Výsledky přicházejí najednou.',
      // Day 5
      'Výsledky přicházejí se zpožděním. Kořeny rostou i tehdy, kdy nic nevidíš. Systém funguje i bez viditelného výsledku.',
      'Malá zlepšení nejsou viditelná. Ale skládají se. To je podstata složeného úroku v osobním rozvoji.',
      // Day 6
      'Warren Buffett: „Tak zkrátka poznání funguje. Hromadí se jako složený úrok." Buffett zbohatl převážně po 60. roce věku – měl dostatek času nechat složený úrok pracovat.',
      'Výzkumy v neuroplasticitě: každé opakování návyku fyzicky mění strukturu mozku. Hippocampus londýnských taxikářů byl prokazatelně větší.',
      // Day 7
      'Nehledej revoluci. Hledej 1%. Dnešní 1% tvoří základ zítřejšího výsledku.',
      'Systém pro sledování: Zapiš si každý den jedno malé zlepšení do poznámek. Za rok budeš mít zápisník pokroku.',
      // Day 8
      'Clear cituje matematika Alfréda Whiteheada: „Civilizace postupuje kupředu rozšiřováním množiny úkonů, které lze provádět bez přemýšlení." Každé 1% zlepšení tuto množinu rozšiřuje.',
      'Agregace: Spočítej svá 1% za posledních 7 dní. Dohromady – je to viditelná změna? Agregace marginálních přírůstků funguje.',
      // Day 9
      'Oblast pro dnešní 1%: Učení. Co jednoho si dnes přečteš nebo se naučíš? Podcast, článek, jedna strana knihy.',
      'Nevzdávej se v „údolí zklamání". Clear varuje: „Neříkejme si, že naše úsilí je marné. Jednoduše ještě nedosáhlo bodu tání."',
      // Day 10
      '10 dní vědomých 1% zlepšení. Které oblasti pokročily nejvíce? Kde jsi byl nejdůslednější? Zachovej tyto vzorce.',
      'Sleduj systém, ne výsledky. Jestli dnes vidíš pokrok nebo ne, je irelevantní – důležité je, zda jsi dnes šel správným směrem.',
    ],
    tips: [
      'Každý den si polož jednu otázku: „Co je jedna věc, kterou bych mohl dnes udělat o trochu lépe nebo jednodušeji?" Nemusí být velká – stačí drobná.',
      'Nevzdávej se v „údolí zklamání". Výsledky nepřicházejí lineárně – hromadí se pod povrchem a pak se najednou projeví.',
      'Sleduj systém, ne výsledky. Jestli dnes vidíš pokrok nebo ne, je irelevantní – důležité je, zda jsi šel správným směrem.',
      'Zapiš si každý den jedno malé zlepšení do poznámek. Za rok budeš mít zápisník pokroku, který ti ukáže, jak daleko jsi přišel.',
    ],
  ),

  // ── TASK 11 ──────────────────────────────────────────────────
  AppTask(
    id: 'spojovani-lakadel',
    name: 'Spojování lákadel',
    description:
        'Spoj jeden obtížný návyk s něčím, co máš rád. Mozek začne vnímat povinnost jako odměnu.',
    durationMinutes: 10,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Ronan Byrne spojil stacionární kolo s Netflixem – Netflix šel jen při šlapání do pedálů. Výsledek: začal cvičit každý den.',
      'Temptation bundling: propojíš to, co bys dělat měl, s tím, co dělat chceš. Povinnost se stane odměnou.',
      // Day 2
      'Vzorec: „[PŘÍJEMNOU VĚC] si dopřeji POUZE tehdy, když dělám [POVINNÝ NÁVYK]."',
      'Posloucháš podcasty nebo audioknihy POUZE při cvičení nebo úklidu. Cvičení = klíč k podcastu.',
      // Day 3
      'Díváš se na oblíbený seriál POUZE při chůzi na páse nebo protahování. Pohyb = vstupenka k seriálu.',
      'Piješ oblíbenou kávu POUZE poté, co si napíšeš denní plán. Plán = podmínka pro kávu.',
      // Day 4
      'Procházíš sociální sítě POUZE poté, co splníš první prioritu dne. Sítě = odměna za produktivitu.',
      'Dopamin se uvolňuje nejen při odměně, ale při jejím očekávání. Mozek začne vnímat povinný návyk jako příjemný.',
      // Day 5
      'Klíč: odměna musí být dostupná JEN tehdy, když děláš návyk. Jinak propojení nefunguje.',
      'Premackův princip: chování s vysokou pravděpodobností výskytu posiluje chování s nízkou pravděpodobností výskytu.',
      // Day 6
      'Nevyčerpávej odměnu mimo návyk – pokud posloucháš podcast i jinak, přestane být motivátorem pro cvičení.',
      'Propojení funguje i obráceně: „Povinný úkol dělám POUZE na oblíbeném místě." Místo jako odměna.',
      // Day 7
      'Kumulace + lákadlo: „Po snídani (spouštěč) jdu cvičit (povinnost) a poslouchám podcast (lákadlo)." Silné spojení tří věcí.',
      'Zhodnoť: Funguje propojení? Těšíš se na povinný návyk díky odměně? Pokud ne, změň odměnu.',
      // Day 8
      'Clear cituje zajímavý výzkum: centra bažení v mozku jsou mnohonásobně větší než centra slasti. Mozek věnuje více kapacity toužení než prožívání. Proto vytváříme očekávání.',
      'Mozek nerozeznává „měl bych" od „chci" – pokud je správně propojen s odměnou. Navrhni svůj systém chytře.',
      // Day 9
      'Kontrola: Vyčerpáváš odměnu mimo návyk? Pokud ano, propojení slábne. Buď přísný na toto pravidlo.',
      'Rozšiř: Přidej druhé propojení. Jiný povinný návyk + jiná příjemná věc. Dva řetězy jsou silnější.',
      // Day 10
      'ABC zavedla „TGIT – Thank God It´s Thursday" s vínem, popcornem a třemi seriály. Diváci si začali spojovat relaxaci s konkrétní stanicí. Asociace pracují za nás.',
      'Sdílej propojení s přítelem. Možná mu navrhneš, co by fungovalo u něj – a sám si to tím upevníš.',
      // Day 11
      'U gamblerů dochází ke vzrůstu hladiny dopaminu těsně před sázkou, a nikoli po výhře. Očekávání je silnější než samotný prožitek. Navrhuj systém odměn s tímto vědomím.',
      'Pozoruj: Kdy ses naposledy vědomě vyhnul lákadlu mimo návyk? To je sebeovládání bez vůle – jen systém.',
      // Day 12
      'Výzkumy: lidé jsou ochotnější podstupovat bolestivé lékařské procedury, pokud mají během nich k dispozici oblíbenou hudbu nebo film. Příjemná věc fyzicky mění prožitek nepříjemné.',
      'Reflexe: Jak se změnil tvůj přístup k povinným návykům za 12 dní? Těšíš se na ně jinak než na začátku?',
      // Day 13
      'Pocit těšení na povinný návyk je důkazem, že propojení funguje. Mozek se přeprogramoval. Odměna vyvolává motivaci k povinnosti.',
      'Pozoruj: Kdy ses naposledy vědomě vyhnul lákadlu mimo návyk? To je sebeovládání bez vůle – jen systém.',
      // Day 14
      '14 dní spojování lákadel. Které propojení fungovalo nejlépe? Zachovej ho natrvalo jako součást své rutiny.',
      'Každé úspěšné propojení dokázalo jednu věc: mozek se dá vědomě přetrénovat. Povinnost se stala lákadlem.',
    ],
    tips: [
      'Odměna musí být dostupná JEN tehdy, když děláš návyk. Jinak propojení nefunguje.',
      'Nevyčerpávej odměnu mimo návyk – pokud posloucháš podcast i jinak, přestane být motivátorem pro cvičení.',
      'Dopamin se uvolňuje nejen při odměně, ale při jejím očekávání. Navrhuj odměnu tak, aby vyvolávala těšení, ne jen uspokojení.',
      'Pravidlo: „[Příjemná věc] POUZE tehdy, když [povinný návyk]." Konzistentní pravidlo je silnější než slibovat si to každý den znovu.',
    ],
  ),

  // ── TASK 12 ──────────────────────────────────────────────────
  AppTask(
    id: 'zavazkovy-prostredek',
    name: 'Závazkový prostředek',
    description:
        'Učiň jedno rozhodnutí dnes, které ti zítra znemožní chovat se špatně. Vědomé omezení je silnější než vůle.',
    durationMinutes: 10,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Victor Hugo: nechal si zamknout veškeré oblečení. Bez šatů nemohl ven – a psal. Chrám Matky Boží odevzdal 2 týdny před termínem.',
      'Závazkový prostředek: rozhodnutí učiněné dnes, které ovlivní tvé chování zítra – dříve, než k pokušení dojde.',
      // Day 2
      'Chceš méně sledovat televizi? Každý večer vytáhni zástrčku a vyjmi baterie z ovladače.',
      'Chceš jíst zdravěji? Kupuj jídlo v obchodě, kde nezdravé pochutiny nenajdeš.',
      // Day 3
      'Chceš méně utrácet? Zablokuj si oblíbené e-shopy v prohlížeči. Jedno rozhodnutí dnes = méně impulzivních nákupů.',
      'Chceš vstávat dříve? Dej budík do jiné místnosti. Fyzická vzdálenost přeruší reflex „snooze".',
      // Day 4
      'Chceš méně prokrastinovat? Oznam svůj plán příteli nebo kolegovi. Sociální závazek funguje silněji než osobní.',
      'Behaviorální ekonomové: lidé selhávají při krátkodobých rozhodnutích, ale ochotně se chovají lépe, pokud rozhodují předem.',
      // Day 5
      'Závazkový prostředek je forma laskavosti k sobě v budoucnosti. Chráníš zítřejšího sebe od dnešních impulzů.',
      'Jednou se rozhodnout správně je jednodušší než odolávat každý den. Nastav prostředí, ne vůli.',
      // Day 6
      'Clear o sobě píše, že nechal asistentce každé pondělí ráno přenastavit hesla na sociálních sítích. Celý týden pracoval bez rozptylování. Jedno rozhodnutí – trvalý efekt.',
      'Odysseus se nechal přivázat ke stěžni, aby mohl naslouchat zpěvu sirén, aniž by k nim navedl loď. Věděl, že v momentě pokušení selže – proto zajistil ochranu předem.',
      // Day 7
      'Reflexe v polovině: Které závazkové rozhodnutí ze začátku stále drží? Které jsi obešel? Proč?',
      'Přidej digitální závazkový prostředek: Nastav časový limit aplikací v nastavení telefonu. Jedna akce dnes.',
      // Day 8
      'Nir Eyal si koupil speciální časovač, který každý večer v 10 hodin vypne internet. „Jakmile se tak stane, vím, že je čas jít spát." Jedno rozhodnutí jednou – automatické chování navždy.',
      'Bryan Harris podepsal s manželkou a osobním trenérem smlouvu specifikující každodenní povinnosti i tresty. Partnerská smlouva je nejsilnější forma závazkového prostředku.',
      // Day 9
      'Závazkový prostředek je obecný princip přírody: plánování dopředu je efektivnější než reaktivní rozhodování. Šachový velmistr neplánuje jeden tah dopředu.',
      'Rozhovor se sebou: „Jaké jedno rozhodnutí dnes ochránní mé zítřejší já před pokušením?" Odpověz a proveď ho.',
      // Day 10
      '10 dní závazkových rozhodnutí. Která ti pomohla nejvíce? Zachovej je jako trvalou součást svého systému.',
      'Závazkový prostředek neznamená slabost – znamená prozíravost. Chráníš svůj záměr před vlastními impulzy.',
    ],
    tips: [
      'Jednou se rozhodnout správně je jednodušší než odolávat každý den. Nastav prostředí dnes, aby pracovalo za tebe zítra.',
      'Závazkový prostředek je forma laskavosti k sobě v budoucnosti. Chráníš zítřejšího sebe od dnešních impulzů.',
      'Partnerská smlouva: formální psaná dohoda, kde si určíš cíl, konkrétní akce a důsledky za porušení. Sociální závazek je nejsilnější forma závazkového prostředku.',
      'Nezávisí na vůli – závisí na prostředí. Nastav podmínky jednou a pak ony pracují za tebe každý den.',
    ],
  ),

  // ── TASK 13 ──────────────────────────────────────────────────
  AppTask(
    id: 'reset-mistnosti',
    name: 'Reset místnosti',
    description:
        'Každý večer uveď jednu místnost do výchozího stavu a připrav ji na zítra. Ušetříš vůli a ráno začneš s čistou hlavou.',
    durationMinutes: 5,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Oswald Nuckols: „Jsem proaktivně líný. Reset místnosti mi ušetří spoustu času a energie druhý den."',
      'Po každé aktivitě vrátit věci na místo a připravit prostor na příští použití. Jednoduché, ale transformační.',
      // Day 2
      'Po sledování televize: ovladač na stolek, polštáře narovnat, deku složit. Celkem asi 60 sekund.',
      'Po vaření: nádobí do myčky, linka utřena, sporák čistý. Čistá kuchyně ráno = jiný – lepší – start dne.',
      // Day 3
      'Po práci u počítače: notesy zavřeny, stůl uklizen, kabel srolován. Fyzický závěr pracovního dne.',
      'Nepořádek v prostoru zvyšuje kognitivní zátěž – mozek stále „vidí" nedokončené úkoly a spotřebovává energii.',
      // Day 4
      'Uklizené prostředí signalizuje mozku, že vše je v pořádku. Uvolní se kapacita pro to, co je skutečně důležité.',
      'Připravené prostředí snižuje tření pro dobrý návyk. Sportovní oblečení na židli = jiný start než prohledávání skříně.',
      // Day 5
      'Reset místnosti je dar sobě budoucímu. Čistý začátek se nesčítá v minutách – sčítá se v kvalitě dne.',
      'Začni s jednou místností nebo jednou aktivitou. Nemusíš resetovat celý byt – jeden rituál stačí pro začátek.',
      // Day 6
      'Vizuální pořádek → mentální pořádek. Prostředí, ve kterém žijeme, odráží a formuje náš vnitřní stav.',
      '„Po večeři udělám 5minutový reset kuchyně." Kumulace návyků: jídlo jako spouštěč pro reset.',
      // Day 7
      'Japonský princip 5S (Třídit, Systematizovat, Čistit, Standardizovat, Udržovat) je průmyslová verze resetu místnosti. Snížil poruchovost výrobků bez jediné jiné změny.',
      'Neurovědci zjistili, že uklizené pracovní místo fyzicky snižuje hladinu kortizolu. Nepořádek ji zvyšuje.',
      // Day 8
      'Reset je snazší v prostředí s méně věcmi. Čeho jednoho by ses dnes mohl zbavit nebo uklidit? Méně věcí = méně tření.',
      'Zapoj druhého člověka: Pokud bydlíš s někým, sdílej princip resetu. Dva lidé – dvojnásobný efekt.',
      // Day 9
      'Clear popisuje manželčinu krabici s přáními seřazenými podle událostí. „Nikdy nezapomene poslat kartu, protože snížila tření." Reset místnosti funguje stejně.',
      'Rozšiřuj postupně: kuchyně → pracovní stůl → ložnice. Každý prostor je rituál péče o sebe.',
      // Day 10
      'Úklid není o dokonalosti. Je o vědomém přechodu: toto je hotovo, jsem připraven na to, co přijde.',
      'Reset jako rituál přechodu: Fyzický pořádek signalizuje mozku konec jedné části dne a začátek jiné.',
      // Day 11
      'Vizualizuj: Jak bude tvůj prostor vypadat za 14 dní pravidelného resetu? Vizualizace posiluje dodržování.',
      'Prostředí formuje mozek stejně jako mozek formuje prostředí. Péče o prostor je péče o sebe.',
      // Day 12
      'Clear cituje japonské výrobní podniky z 70. let: systematicky odstraňovaly každý zdroj plýtvání. Reset místnosti je osobní ekvivalent tohoto principu.',
      'Minimalizace: Reset je snazší, pokud máš méně věcí. Jednoduché prostředí vyžaduje méně energie k údržbě.',
      // Day 13
      '„Sčítání odčítáním" – méně tření vede k více výkonu. Reset místnosti je nejjednodušší způsob, jak si snížit tření v každodenním životě.',
      'Zaznamenej: Jak se cítíš ráno po večerním resetu vs. bez něj? Porovnání posílí motivaci pokračovat.',
      // Day 14
      '14 dní resetu. Který prostor se změnil nejvíce? Jak se to promítlo do tvé mysli a ranní energie?',
      'Reset místnosti není povinnost – je to investice do klidnějšího, soustředěnějšího zítřka. Daruj sobě budoucímu čistý začátek.',
    ],
    tips: [
      'Pravidlo: resetuj vždy po každé aktivitě, ne až „jednou za čas". Kontinuita tvoří návyk.',
      'Reset není o dokonalosti. Je o vědomém přechodu: toto je hotovo, jsem připraven na to, co přijde.',
      'Minimalizace: Reset je snazší, pokud máš méně věcí. Jednoduché prostředí vyžaduje méně energie k údržbě.',
      'Kumulace: „Po [stávající aktivitě] udělám 5minutový reset." Propojení s existující rutinou zaručuje pravidelnost.',
    ],
  ),

  // ── TASK 14 ──────────────────────────────────────────────────
  AppTask(
    id: 'meditace-2-minuty',
    name: 'Meditace 2 minuty',
    description:
        'Každý den si sedni, zavři oči a vnímej dech po dobu 2 minut. Výzkumy potvrzují, že i krátká meditace snižuje stres a zlepšuje soustředění.',
    durationMinutes: 2,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Meditace není o dokonalém tichu – je o trénování pozornosti. Každé rozptýlení + návrat k dechu = jedno opakování.',
      'Clear: „Meditace není o prázdné mysli. Je o tréninku všímavosti – schopnosti si uvědomit, co se děje, aniž bys byl přemožen."',
      // Day 2
      'Studie: 2 týdny meditace po 10 minutách denně zlepšily skóre standardizovaného testu průměrně o 16 %.',
      'Johns Hopkins University: meditace prokazatelně snižuje příznaky úzkosti a deprese. Analýza 47 studií potvrdila konzistentní výsledky.',
      // Day 3
      'Jak na to: Sedni si, nastav časovač na 2 minuty, zavři oči a soustřeď se na dech. Nádech – výdech.',
      'Když se myšlenky zatoulají – to je normální a nevyhnutelné. Klidně se vrať k dechu. To je celá praxe.',
      // Day 4
      'Harvardská medicínská škola: 8 týdnů pravidelné meditace fyzicky změní strukturu mozku – zhuštění šedé hmoty v prefrontální kůře (sebeovládání) a zmenšení amygdaly (stresové reakce).',
      'James Clear: „Nepotřebuješ dokonalý návyk. Potřebuješ existující návyk." 2 minuty jsou dostatečný začátek.',
      // Day 5
      'Většina lidí, kteří začnou se 2 minutami, přirozeně přejde na 5, pak 10 minut. Začít je klíčové.',
      'Přerámování: místo „musím meditovat" → „dostávám příležitost trénovat pozornost." Tento posun mění celý prožitek.',
      // Day 6
      'Meditace trénuje metakognitivní schopnost: uvědomit si, kde je tvá mysl, a záměrně ji přesunout. Tato schopnost přetéká do celého dne.',
      '2 minuty denně tvoří základ pozornosti. Jako každý trénink – efekt přichází postupně, ne okamžitě.',
      // Day 7
      'Meditace v pohybu: Zkus 2 minuty vědomé chůze – soustřeď se pouze na kroky a dech. Meditace není jen sezení.',
      'Jak se cítíš po meditaci vs. bez ní? Zaznamenej stručně do poznámek. Data motivují k pokračování.',
      // Day 8
      'Dnes: Medituj ve chvíli, kdy se cítíš stresovaně nebo roztěkaně. Pozoruj, co se stane po 2 minutách zaměření na dech.',
      'Techniku kumulace lze přímo aplikovat: „Po ranní kávě zavřu oči na 2 minuty." Meditace dostane pevné místo v existující rutině.',
      // Day 9
      'Každý návrat k dechu při meditaci je jako opakování v posilovně. Rozptýlení nejsou selhání – jsou trénink.',
      'Přečti si o jedné formě meditace, kterou jsi nezkoušel (body scan, loving-kindness, vizualizace). Rozmanitost udržuje praxi živou.',
      // Day 10
      '10 dní meditace. Celkový čas: přibližně 20 minut. Co ti dalo více, než jsi očekával? Zapiš si to.',
      'Meditace je jedna z mála praxí, kde pravidelnost poráží délku. 2 minuty každý den jsou silnější než 20 minut jednou za týden.',
    ],
    tips: [
      'Meditace není o prázdné mysli. Je o tréninku všímavosti – schopnosti si uvědomit, co se děje, aniž bys byl přemožen.',
      'Kumulaci použij přímo: „Po ranní kávě zavřu oči na 2 minuty." Meditace dostane pevné místo v existující rutině.',
      'Místo „musím meditovat" si říkej „dostávám příležitost trénovat pozornost." Tento posun mění celý prožitek.',
      'Každý návrat k dechu je opakování – jako bicepskurl. Rozptýlení nejsou selhání, jsou součástí tréninku.',
    ],
  ),

  // ── TASK 15 ──────────────────────────────────────────────────
  AppTask(
    id: 'denik-vdecnosti',
    name: 'Deník vděčnosti',
    description:
        'Každý den napiš 3 věci, za které jsi vděčný. Výzkumy ukazují, že tato praxe snižuje stres, zlepšuje náladu a mění způsob, jakým vnímáš svůj život.',
    durationMinutes: 5,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Negativní zkreslení (negativity bias): mozek přirozeně vidí hrozby. Vděčnost ho trénuje vidět i příležitosti.',
      'Robert Emmons (UC Davis): lidé píšící vděčnost pravidelně vykazují o 25 % vyšší subjektivní pohodu.',
      // Day 2
      'Přímé dopady pravidelné vděčnosti: lepší spánek, nižší stres, větší ochota pomáhat druhým. Vše v jedné 5minutové praxi.',
      'Jak na to: 3 konkrétní věci denně. Ne „jsem vděčný za rodinu", ale „máma mi dnes zavolala a ptala se, jak mi je".',
      // Day 3
      'Specifičnost je klíčová: čím konkrétnější, tím silnější neurální otisk. Mozek si pamatuje detaily, ne kategorie.',
      'Napiš krátce proč – to posiluje efekt. Konkrétní důvod aktivuje hlubší zpracování pozitivní zkušenosti.',
      // Day 4
      'Různorodost je důležitější než množství. 3 různé věci každý den jsou lepší než opakovat stále stejné.',
      'Mozek se postupně přeorientuje: místo automatického hledání problémů začne hledat to, co funguje. Neuroplasticita v praxi.',
      // Day 5
      'Vděčnost není popírání problémů – je to přidání dalšího filtru vnímání, který byl dříve deaktivovaný.',
      'Clear popisuje, jak náš mozek je od rána do večera v predikčním módu. Negativní predikce jsou evolucionárně bezpečnější. Deník vděčnosti tento bias vědomě koriguje.',
      // Day 6
      '5 minut denně trénuje mozek na nový způsob vnímání světa. Za 10 dní začneš přirozeně hledat dobré věci.',
      'Neurovědci zjistili, že praxe vděčnosti aktivuje prefrontální kůru a snižuje aktivitu amygdaly. Je to jedna z mála praxí, která prokazatelně mění přirozené nastavení mozku.',
      // Day 7
      'Sdílej dnes vděčnost přímo: Řekni nebo napiš jednomu člověku, proč jsi za něj vděčný. Konkrétně.',
      'Vděčnost při negativní náladě: Zkus napsat 3 věci právě teď, i když se cítíš špatně. Pozoruj, co se změní.',
      // Day 8
      'Hledání dobra: Dnes během dne vědomě hledej 3 věci, za které budeš večer vděčný. Aktivní pozornost.',
      'Přečti si zápisky z prvních dní. Vzpomínáš si na tyto věci? Vděčnost uloží pozitivní zážitky do paměti silněji.',
      // Day 9
      'Ranní vs. večerní vděčnost: Zkus dnes psát ráno. Jak to ovlivní tvůj pohled na nadcházející den?',
      'Různorodost: Dnes se zaměř na věci mimo osobní vztahy – práce, příroda, náhody, věci, které fungovaly.',
      // Day 10
      '10 dní deníku vděčnosti. Přečti si všechny záznamy. Jaký vzorec vidíš? Co ti přináší největší vděčnost?',
      'Každý den, kdy jsi napsal 3 věci, jsi vědomě posunul svůj mozek blíže k pozitivnímu výchozímu nastavení. To se nesmaže.',
    ],
    tips: [
      'Buď specifický: „Jsem vděčný za to, že mi dnes ráno zavolal kamarád a rozesmál mě" je silnější než „jsem vděčný za přátele".',
      'Různorodost je klíčová: psát stále stejné věci má klesající efekt. Každý den hledej nové věci.',
      'Ke každé věci přidej jednu větu PROČ. „Jsem vděčný za... protože..." Proč posiluje neurální otisk.',
      'Zkus psát ráno místo večer. Ranní vděčnost nastaví pozitivní filtr pro celý den.',
    ],
  ),

  // ── TASK 16 ──────────────────────────────────────────────────
  AppTask(
    id: 'denni-pohyb',
    name: 'Denní pohyb – 10minutová procházka',
    description:
        'Vyjdi každý den ven na 10 minut. Pohyb venku je jedním z nejsilnějších přirozených antidepresiv a spouští mozek do kreativního módu.',
    durationMinutes: 10,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Desetiminutová procházka venku – výzkumy ukazují okamžité zlepšení nálady, kognitivního výkonu a kreativního myšlení.',
      'Stanford 2014: chůze zvyšuje kreativní myšlení o 81 %. Chůze venku ho zvyšuje ještě více. Efekt přetrvával i po návratu ke stolu.',
      // Day 2
      'Nature (2022): 20 minut v přírodě snižuje kortizol ekvivalentně jako 15 minut meditace.',
      'Pohyb venku + přirozené světlo: resetuje cirkadiánní rytmus, snižuje kortizol, zvyšuje serotonin a endorfiny.',
      // Day 3
      'Kumulace: „Po obědě jdu na 10minutovou procházku." Oběd je spolehlivý každodenní spouštěč.',
      '„Po práci si jdu projít." Pohyb jako přirozený přechod mezi pracovním a osobním časem.',
      // Day 4
      '„Ráno před snídaní vyjdu ven na vzduch." Ranní světlo je jeden z nejsilnějších regulátorů biologických hodin.',
      'Tip: Nech telefon doma nebo v kapse. Procházka bez scrollování má výrazně větší efekt na regeneraci mozku.',
      // Day 5
      'Chůze je forma aktivní meditace – rytmický pohyb uklidňuje nervový systém a umožňuje přirozené zpracování myšlenek.',
      'Lidé, kteří chodí alespoň 10 minut denně venku, reportují výrazně vyšší spokojenost se životem.',
      // Day 6
      'I deštivé dny se počítají. Přirozené světlo (i skrze mraky) má vliv na biologické hodiny.',
      'Procházka je jedna z mála aktivit, kde „nuda" není problém – mozek potřebuje nenucený čas pro kreativitu.',
      // Day 7
      'Zkus jít jinudy než obvykle. Novost prostředí aktivuje nová neurální spojení a zvyšuje bdělost.',
      '10 minut venku každý den je nejlevnější a nejdostupnější nástroj na stres, únavu a nízkou kreativitu.',
      // Day 8
      'Aristotelova škola se nazývala Peripatetická (z řeckého peripatein – procházet se), protože přednášel za chůze. Pohyb a myšlení jsou pro mozek přirozeně spjaté.',
      'Výzkumy z oblasti psychologie: chůze venku bez telefonu má výrazně vyšší regenerační efekt. Mozek v přírodě odpočívá – ale pouze tehdy, když není bombardován podněty.',
      // Day 9
      'Příroda vs. město: Pokud je možno, jdi dnes do parku nebo blíže k zeleni. Studie potvrzují větší efekt na stresové hormony.',
      'Sdílej procházku: Pozvi dnes někoho na 10minutovou procházku. Sociální pohyb je udržitelnější.',
      // Day 10
      'Ranní světlo: Pokus se jít ven do 30 minut po probuzení. Ranní světlo je silný regulátor biorytmu a nálady na celý den.',
      'Kreativní procházka: Dnes si ber s sebou malý zápisník. Co tě napadne při chůzi? Nejlepší nápady přicházejí v pohybu.',
      // Day 11
      'Zkus pomalou procházku: záměrně jdi pomaleji než obvykle. Pomalá chůze maximalizuje efekt na nervový systém.',
      'Procházka bez sluchátek: Zkus jít bez muziky nebo podcastu. Vnímej zvuky, světlo, prostor kolem sebe. Přirozená stimulace.',
      // Day 12
      'Rozšiř na 15 minut: Pokud ti 10 minut přijde krátké, přidej 5 minut. Bez tlaku – jen pokud přirozeně chceš.',
      'Nová trasa: Jdi dnes jinou cestou než obvykle. Nové prostředí = nová stimulace mozku a vyšší bdělost.',
      // Day 13
      'Sleduj náladu: Jak se cítíš před procházkou vs. po ní? Dnes vědomě porovnej. Data posilují návyk dlouhodobě.',
      '10 minut pohybu venku je ekvivalent 15 minut meditace pro kortizol – a navíc tě to posune ve fyzickém zdraví.',
      // Day 14
      '14 dní pohybu venku. Jak se změnila tvá energie, nálada a kreativita? Zapiš konkrétní pozorování.',
      'Každý den, kdy jsi vyšel ven, jsi svému mozku a tělu dal přesně to, co evolucí potřebuje. Pohyb venku je přirozený stav člověka.',
    ],
    tips: [
      'Aplikuj kumulaci návyků: „Po obědě jdu na 10minutovou procházku." Oběd je spolehlivý každodenní spouštěč.',
      'Nech telefon doma nebo v kapse. Pokud musíš mít telefon, dej ho do tichého režimu. Procházka bez scrollování má 3× větší efekt.',
      'Pokud je venku špatné počasí, jdi stejně – krátce. Profesionál pracuje, i když ho to nebaví. Totéž platí pro pohyb.',
      'Ranní světlo: pokus se jít ven do 30 minut po probuzení. Ranní světlo je silný regulátor biologických hodin a nálady na celý den.',
    ],
  ),

  // ── TASK 17 ──────────────────────────────────────────────────
  AppTask(
    id: 'bez-telefonu-pri-jidle',
    name: 'Bez telefonu při jídle',
    description:
        'Po dobu jídla odlož telefon stranou. Vědomé jídlo zlepšuje trávení, snižuje přejídání a je to forma tréninku přítomnosti.',
    durationMinutes: 20,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Průměrný člověk tráví při jídle pohledem do telefonu 65 % času. Mozek nedostává signály nasycení včas.',
      'Studie: lidé jedící při sledování obrazovky konzumují o 10 % více kalorií a jsou méně spokojení s jídlem.',
      // Day 2
      'Brigham Young University: jedení bez rozptylování je spojeno s nižším BMI a lepší regulací hmotnosti.',
      'Jak na to: Před každým jídlem odlož telefon na jiné místo – do druhé místnosti nebo do tašky.',
      // Day 3
      'Jez pomalu a vnímej chuť, vůni a texturu jídla. Vědomé jídlo je forma tréninku přítomnosti.',
      'Pokud jíš s někým, věnuj pozornost rozhovoru – ne notifikacím. Jídlo jako sociální rituál.',
      // Day 4
      'Pravidlo „jedno místo, jeden účel": stůl je k jídlu a rozhovoru, ne k práci nebo scrollování.',
      'Vědomé jídlo aktivuje parasympatický nervový systém (odpočinek a trávení) místo sympatického (stres).',
      // Day 5
      'Bez rozptylování mozek lépe vnímá chuť jídla – a přirozeně si začne vybírat kvalitnější jídlo.',
      'Odložení telefonu při jídle je jedna z nejjednodušších forem vědomé přítomnosti. 20 minut bez rozptylování.',
      // Day 6
      'Asociace přežívají dekády: žena, která přestala kouřit, po 20 letech nasedla na koně a okamžitě dostala chuť na cigaretu. Kouřila vždy při jízdě. Asociace stůl + telefon se zpevňuje každým opakováním.',
      'Japonská filozofie mindfulness (ičigo ičie – „jednou za život") říká, že každý okamžik je jedinečný. Vědomé jídlo je praxe tohoto principu.',
      // Day 7
      'Chuťové vědomí: Zkus dnes pojmenovat 3 různé chutě nebo textury v jednom jídle. Pozornost na jídlo = meditace.',
      'Hlad vs. plnost: Dnes vnímej, kdy se začínáš cítit sytý. Bez rozptylování mozek signály nasycení přijímá dříve.',
      // Day 8
      'Přenes pravidlo na svačiny: Nejen u hlavního jídla – u každého jídla nebo svačiny odlož telefon stranou.',
      'Trávení je řízeno parasympatickým nervovým systémem, který se aktivuje v klidu. Stres a rozptylování aktivují sympatický systém – který trávení doslova brzdí.',
      // Day 9
      'Sdílej pravidlo: Pokud jíš s někým, navrhni pravidlo „telefony mimo stůl." Sdílené prostředí posiluje návyk.',
      'Reflexe: Jak jinak chutná jídlo, když jsi plně přítomen? Zaznamenej svůj postřeh – budeš se k tomu vracet.',
      // Day 10
      '10 dní vědomého jídla. Jak se změnil tvůj vztah k jídlu? Jíš jinak? Cítíš se jinak? Zapiš závěr.',
      'Každé jídlo bez telefonu bylo trénink přítomnosti. 10 dní × 3 jídla = 30 opakování vědomé přítomnosti v každodenním životě.',
    ],
    tips: [
      'Zavedení tohoto pravidla je snazší v prostředí, kde je telefon fyzicky jinde. Dej ho do jiné místnosti nebo do tašky.',
      'Pokud jíš s někým, toto pravidlo je přirozenou příležitostí ke skutečnému rozhovoru – nebo vědomému soustředění na jídlo v tichu.',
      'Pokud jíš sám a ticho ti přijde nepohodlné, zkus jíst s hudbou místo obrazovky. Hudba je pasivní – nepotřebuje tvoji pozornost.',
      'Pravidlo: fyzicky odlož telefon jinam – nestačí jen obrátit obrazovkou dolů. Fyzické oddělení odstraňuje podnět.',
    ],
  ),

  // ── TASK 18 ──────────────────────────────────────────────────
  AppTask(
    id: 'precteni-jedne-stranky',
    name: 'Přečti jednu stránku',
    description:
        'Každý den si přečti alespoň jednu stránku knihy. Za rok přečteš 10–15 knih. Čtení je nejrychlejší způsob, jak si přisvojit zkušenosti nejlepších lidí na světě.',
    durationMinutes: 10,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Warren Buffett: „Čtení je základ mého úspěchu. Poznání funguje jako složený úrok – hromadí se."',
      'Čtení beletrie zlepšuje empatii. Čtení literatury faktu rozšiřuje myšlenkové rámce. Obojí mění mozek.',
      // Day 2
      'University of Sussex: čtení snižuje stres o 68 % – více než hudba (61 %), čaj (54 %) nebo procházka.',
      'Cílem není přečíst 50 stránek. Cílem je každý den otevřít knihu. Jedna stránka je vítězství.',
      // Day 3
      'Pravidlo dvou minut: „Každý den si přečtu jednu stránku." Tak malé, že odmítnutí je téměř absurdní.',
      'Kumulace: „Po večeři si přečtu jednu stránku." Večeře jako spolehlivý každodenní spouštěč.',
      // Day 4
      'Prostředí: Polož knihu na noční stolek – ne do poličky. Viditelná kniha = přečtená kniha.',
      'Pravidlo: Telefon jde v posteli na nabíječku, kniha ti zůstane v ruce. Fyzická výměna – jednoduchá, ale účinná.',
      // Day 5
      'Tip: Čti to, co tě skutečně zajímá. Motivace číst oblíbenou knihu je tisíckrát vyšší než číst tu „správnou".',
      '1 stránka denně = 365 stránek ročně. 10 stránek denně = přibližně 10–15 knih ročně. Složený úrok v praxi.',
      // Day 6
      'Čtení buduje slovní zásobu, analytické myšlení a schopnost hlubokého soustředění.',
      'Nevytrhávej se z čtení při každé notifikaci. Dej telefon do letového režimu na dobu čtení.',
      // Day 7
      'Sleduj, co čteš. Jednoduchý seznam knih zvyšuje motivaci číst a umožňuje reflexi přečteného.',
      'Každá přečtená stránka je investice do budoucího já. Čtení je nejrychlejší způsob, jak si přisvojit zkušenosti nejlepších lidí.',
      // Day 8
      'Steve Martin strávil 18 let budováním svého komediálního umění: „Deset let učení, čtyři roky pilování, čtyři roky závratného úspěchu." Čtení je část tohoto procesu.',
      'Zapiš si jednu myšlenku z dnešního čtení. Jeden postřeh nebo otázka. Reflexe prohlubuje porozumění 2×.',
      // Day 9
      'Sdílej, co čteš, s někým. Doporučení nebo jen zmínění zvyšuje závazek k dokončení a přináší nové perspektivy.',
      'Podtrhuj nebo si piš poznámky. Aktivní čtení (s perem) je 2× efektivnější než pasivní čtení.',
      // Day 10
      'Bill Gates přečte 50 knih ročně. Elon Musk strávil jako dítě čtením 10 hodin denně. Warren Buffett věnuje čtení 80 % pracovního dne.',
      'Clear cituje matematika Whiteheada: „Civilizace postupuje rozšiřováním množiny úkonů, které lze provádět bez přemýšlení." Každá přečtená kniha tuto množinu rozšiřuje.',
      // Day 11
      'Různé žánry: Čteš vždy stejný typ knih? Zkus jednou jinou oblast – fikce, faktografii, psychologii, biografii. Nová perspektiva.',
      'Komunitní čtení: Existuje někdo ve tvém okolí, kdo čte stejnou nebo podobnou knihu? Mluvte o ní. Diskuse prohlubuje porozumění.',
      // Day 12
      'Clear: „Snažit se najít nejlepší plán je snadné, nekončí to však žádnými výsledky." Jedna stránka denně je jednání. Přemýšlet o čtení je pohyb.',
      'Čtení vs. scrollování: Dnes si spočítej, kolik minut jsi scrolloval a kolik četl. Jen zaznamenáš – bez hodnocení. Uvědomění mění chování.',
      // Day 13
      'Nevytrhávej se z čtení při každé notifikaci. Letový režim na dobu čtení = chráněný čas pro hlubokou práci mozku.',
      'Každé splnění – i jediná stránka – je hlasování pro identitu čtenáře. „Jsem typ člověka, který každý den čte."',
      // Day 14
      '14 dní čtení. Kolik stránek celkem? Jaká myšlenka z knihy tě nejvíc oslovila? Zapiš ji pro sebe.',
      'Čtení jedné stránky denně po 14 dní dokázalo jednu věc: jsi typ člověka, který čte. Teď to jen pokračuje dál.',
    ],
    tips: [
      'Čti to, co tě skutečně zajímá. Číst detektivku každý den je lepší než nečíst nic.',
      'Kumulace návyků: „Po večeři si přečtu jednu stránku." Tak se čtení stane přirozenou součástí existující rutiny.',
      'Polož knihu na noční stolek – ne do poličky. Viditelná kniha = přečtená kniha.',
      'Podtrhuj nebo si piš poznámky. Aktivní čtení (s perem) je 2× efektivnější než pasivní čtení.',
    ],
  ),
];
