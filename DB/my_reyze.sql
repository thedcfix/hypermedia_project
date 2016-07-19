-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Lug 20, 2016 alle 00:00
-- Versione del server: 5.6.29-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_reyze`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assistenza`
--

CREATE TABLE IF NOT EXISTS `assistenza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_device` varchar(40) NOT NULL,
  `servizio` varchar(50) NOT NULL,
  `descrizione` longtext NOT NULL,
  `video` varchar(255) NOT NULL,
  `img` varchar(40) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dump dei dati per la tabella `assistenza`
--

INSERT INTO `assistenza` (`id`, `categoria_device`, `servizio`, `descrizione`, `video`, `img`, `views`) VALUES
(1, 'iOS', 'Messaggistica', 'Guarda come utilizzare i servizi di messaggistica sul tuo dispositivo.', 'video/1.mp4', 'img/messaggistica.png', 1),
(2, 'iOS', 'Contatti', 'Guarda come gestire i contatti sul tuo dispositivo.', 'video/1.mp4', 'img/contatti.png', 2),
(3, 'Android', 'Messaggistica', 'Guarda come utilizzare i servizi di messaggistica sul tuo dispositivo.', 'video/1.mp4', 'img/messaggistica.png', 1),
(4, 'Android', 'Contatti', 'Guarda come gestire i contatti sul tuo dispositivo.', 'video/1.mp4', 'img/contatti.png', 1),
(5, 'iOS', 'Cloud', 'Guarda come utilizzare il cloud sul tuo dispositivo.', 'video/1.mp4', 'img/cloud.png', 0),
(6, 'Android', 'Cloud', 'Guarda come utilizzare il cloud sul tuo dispositivo.', 'video/1.mp4', 'img/cloud.png', 1),
(7, 'Windows', 'Messaggistica', 'Guarda come utilizzare i servizi di messaggistica sul tuo dispositivo.', 'video/1.mp4', 'img/messaggistica.png', 1),
(8, 'Windows', 'Contatti', 'Guarda come gestire i contatti sul tuo dispositivo.', 'video/1.mp4', 'img/contatti.png', 0),
(9, 'Windows', 'Cloud', 'Guarda come utilizzare il cloud sul tuo dispositivo.', 'video/1.mp4', 'img/cloud.png', 1),
(10, 'Modem', 'Configurazione', 'Scopri come configurare il tuo dispositivo.', 'video/1.mp4', 'img/impostazioni.png', 1),
(11, 'Modem', 'Informazioni', 'Ricevi informazioni generali sul tuo modem.', 'video/1.mp4', 'img/cerca.png', 0),
(12, 'Tv e smart life', 'Configurazione', 'Scopri come configurare il tuo dispositivo.', 'video/1.mp4', 'img/impostazioni.png', 1),
(13, 'Tv e smart life', 'Informazioni', 'Ricevi informazioni generali sul tuo modem.', 'video/1.mp4', 'img/cerca.png', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE IF NOT EXISTS `immagini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `disp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disp_id` (`disp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dump dei dati per la tabella `immagini`
--

INSERT INTO `immagini` (`id`, `img`, `disp_id`) VALUES
(1, 'img/iPhone0.jpg', 1),
(2, 'img/iPhone1.png', 1),
(3, 'img/iPhone2.jpg', 1),
(4, 'img/iPhone3.jpg', 1),
(5, 'img/SamsungS70.jpg', 2),
(6, 'img/SamsungS71.jpg', 2),
(7, 'img/SamsungS72.jpg', 2),
(8, 'img/SamsungS73.jpg', 2),
(9, 'img/galaxyfit0.jpg', 6),
(10, 'img/ipadpro0.jpg', 7),
(11, 'img/ipadpro1.jpg', 7),
(12, 'img/ipadpro2.jpg', 7),
(13, 'img/dlink0.jpg', 3),
(14, 'img/lumia0.jpg', 4),
(15, 'img/lumia1.jpg', 4),
(16, 'img/lumia2.jpg', 4),
(17, 'img/galaxyfit1.jpg', 6),
(18, 'img/t10.jpg', 8),
(19, 'img/t11.jpg', 8),
(20, 'img/smarttv0.jpg', 9),
(21, 'img/smarttv1.jpg', 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE IF NOT EXISTS `prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `colore` varchar(30) DEFAULT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `categoria` varchar(30) NOT NULL,
  `tipologia` varchar(30) NOT NULL,
  `panoramica` longtext,
  `descrizione` longtext,
  `specifiche` longtext,
  `in_evidenza` tinyint(1) DEFAULT NULL,
  `outlet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `nome`, `colore`, `prezzo`, `marca`, `categoria`, `tipologia`, `panoramica`, `descrizione`, `specifiche`, `in_evidenza`, `outlet`) VALUES
(1, 'iPhone 6S', 'Nero', 799.99, 'Apple', 'iOS', 'Smartphone', '<p>Inizi a usare iPhone 6s e ti rendi subito conto che non hai mai provato niente del genere. Con il 3D Touch ti basta premere una volta sul display perche''; si aprano tante nuove possibilita''. Live Photos da'' piu'' vita ai tuoi ricordi. E questo e'' solo l''inizio. Continua a usare il tuo iPhone 6s e scoprirai tutte le innovazioni che racchiude, a ogni livello.</p>', '<p>iPhone 6S appartiene alla nona generazione di smartphone sviluppati dalla casa californiana Apple, successore insieme al fratello maggiore iPhone 6S Plus di iPhone 6 e iPhone 6 Plus presentati nel corso del mese di Settembre 2014. e'' stato presentato nel corso del Keynote del 9 settembre 2015 assieme all''iPhone 6S Plus, all''iPad Pro 12.7" (a Maggio 2016 e'' stata annunciata anche una versione piu'' piccola da 9.7") e alla Apple TV di quarta generazione.<br />e'' disponibile in quattro colorazioni: argento, grigio siderale, oro e oro rosa.</p>', '<p>Sistema Operativo iOS 9 e iCloud<br />Display Retina HD da 4,7"<br />Chip A9<br />Fotocamera iSight da 12 megapixel</p>', 1, 0),
(2, 'Samsung Galaxy S7', 'Nero', 699.99, 'Samsung', 'Android', 'Smartphone', '<p>Abbiamo fatto grandi progressi, superando i limiti odierni e rendendo possibile quello che finora era impossibile, ascoltando sempre i vostri suggerimenti. Abbiamo trovato un perfetto equilibrio tra forma e tecnologia, sviluppando funzioni mai viste nei Galaxy precedenti, e di cui non potrete piu'' farne a meno. Galaxy S7 e S7 edge.</p>', '<p>Il Samsung Galaxy S7 e'' uno smartphone top di gamma prodotto da Samsung. e'' stato presentato ufficialmente il 21 febbraio 2016 durante una conferenza stampa Samsung al Mobile World Congress 2016 ed e'' stato messo in commercio l''11 marzo in Europa e Nord America. Come il suo predecessore, l''S7 viene prodotto anche in variante Edge.<br />Il Galaxy S7 e'' una grande evoluzione del modello dell''anno precedente, ripristinando un paio di funzionalita'' del Galaxy S5; la certificazione IP68 per la resistenza all''acqua e resistenza alla polvere, cosi'' come l''espandibilita'' della memoria con una microSD. Queste modifiche fatte su Galaxy S7 hanno fatto in modo che Samsung vedesse piu'' di 10 milioni di S7 in 20 giorni battendo il record di S5 e di S6. Chiudendo cosi'' il primo trimestre con 5.7 miliardi di dollari, dati dalle vendite di smartphones grazie soprattutto a S7.</p>', '<p>Sistema Operativo Android 6.0<br />Display 5.5"<br />Processore OctaCore (QuadCore 2.3 Ghz + QuadCore 1.6 Ghz)<br />Tecnologia<br />4G cat.9/HSDPA42UMTS/EDGE/GPRS Frequenze 850/900/1800/1900/2100<br />Connettivita<br />Wi-Fi - Bluetooth - Micro USB - NFC<br />GPS<br />Integrato<br />Display<br />5.5" 16 Milioni colori Touch<br />Fotocamera<br />12 Mpixel/Flash<br />Memoria Interna<br />32GB<br />Processore<br />OctaCore: (QuadCore 2.3 Ghz+QuadCore 1.6 Ghz)<br />Formato SIM<br />Nano<br />Video<br />Video Recorder&amp;Playback<br />Musica<br />MP3 Player<br />In dotazione<br />Caricabatteria - Cavo Dati MicroUSB - Auricolare stereo - Guida di riferimento rapido<br />Dimensioni<br />150,9x72,6x7,7 mm<br />Peso<br />157 gr.<br />Autonomia<br />Stand-by fino a TBD ore - Conversazione fino a TBD min</p>', 0, 1),
(3, 'DLink Smart Home', NULL, 122.50, 'D-Link', 'Smart Life', 'Modem', '<p>Con lo Smart Home HD Starter Kit potrai impostare, controllare, monitorare e automatizzare la tua casa ovunque ti trovi.<br />Nel Kit sono inclusi:<br />Un Monitor HD (DCS-935L) <br />Un Wi-Fi Motion Sensor (DCH-S150)<br />Una smart plug (DSP-W215) <br />Tramite l''App mydlink Home per smartphone e tablet hai a disposizione il controllo di tutti i dispositivi cosi'' da semplificarti la gestione della casa rendendola piu'' sicura e intelligente.<br />Facile configurazione e gestione dei tuoi dispositivi<br />Basta semplicemente scaricare l''app mydlink Home e la configurazione guidata ti aiutera'' a utilizzare al meglio tutti i dispositivi presenti nel kit in modo facile e intuitivo.<br />Con l''app potrai creare tu stesso le regole per accendere e spegnere i tuoi elettrodomestici quando e ovunque vuoi. <br />Notifiche automatiche e real time sul tuo smartphone<br />L''app mydlink Home ti notifichera'' quando:<br />Un movimento o un suono viene rilevato<br />Un dispositivo e'' stato acceso o spento<br />Il consumo elettrico e'' stato superato<br />Un dispositivo non funziona correttamente o si surriscalda<br />Il sensore di movimento a infrarossi passivo riduce di gran lunga i falsi allarmi garantendoti di essere avvisato solo quando necessario: rilevazione dei movimenti fino a 8 metri.</p>', '<p>Monitor HD<br /><br />Con il Monitor HD, potrai controllare la tua casa in alta definizione (720p) e grazie alla visione notturna anche in assenza di luce (fino a 5 mt). Il Monitor HD ti avvisa mediante notifica push ogni volta che verra'' rilevato un suono o un movimento.</p>\n<p>Sensore di movimento<br />Grazie alla tecnologia a infrarossi passiva saranno ridotti i falsi allarmi e verrai avvisato solo quando necessario. Con il sensore di movimento rileverai i movimenti fino a 8 metri.<br /><br />Smart Plug<br />Potrai accendere e spegnere i dispositivi dal tuo smartphone tablet, ovunque ti trovi. Essere avvisato se un elettrodomestico e'' stato acceso o spento. Impostare nuove regole di funzionamento in base alle tue esigenze.<br /><br />Connettivita'' Mobile<br />Vuoi monitorare la tua casa al mare o in montagna quando non ci sei? Vuoi avere sempre sott''occhio la tua macchina quando e'' in garage? <br />La tua barca o il tuo camper nei mesi in cui non li utilizzi? <br />Anche se non disponi di una connessione ADSL in questi luoghi puoi utilizzare D-Link Smart Home Starter Kit con una connessione mobile 3G o 4G Wi-Fi.</p>', '<p>Servizio gratuito<br />Visualizzazione da smartphone o tablet delle riprese<br />Invio notifiche su smartphone/tablet/e-mail<br />Connettivita'' Wi-Fi tramite ADSL o modem mobile 3G o 4G</p>', 1, 0),
(4, 'Lumia 950', 'Bianco', 399.49, 'Microsoft', 'Windows', 'Smartphone', '<p>Il Microsoft Lumia 950 e'' uno smartphone di fascia alta prodotto dalla Microsoft che fa parte della serie Lumia, successore del Nokia Lumia 930. Inaugura la serie x50 della gamma Lumia insieme al Microsoft Lumia 950 XL e al Microsoft Lumia 550.<br />Presentato a New York il 6 ottobre del 2015, e'' uscito sul mercato nel novembre 2015, disponibile nei colori bianco e nero opaco.<br />Il Lumia 950 e'' il primo smartphone della gamma Lumia ad essere equipaggiato con Windows 10 Mobile, ad avere 3 GB di Memoria RAM, ad avere una risoluzione QHD e l''uscita USB di tipo C. Supporta la funzione Continuum di Windows 10. Monta una fotocamera da 20 megapixel con 6 lenti ZEISS.</p>', '<p>Funzionalita'' di livello superiore, design eccellente e la migliore esperienza con Windows 10: scegli Lumia 950 e trasforma un momento qualsiasi in una grande conquista.<br />Scopri tutto quello che puoi fare con il tuo Microsoft Lumia.</p>', '<p>Sistema Operativo Windows 10 Mobile<br />Display 5.2"<br />Processore Snapdragon 808 HexaCore 1.8 Ghz - 4G <br />Tecnologia<br />4G cat.6/HSDPA 42/UMTS/EDGE/GPRS Frequenze 850/900/1800/1900<br /><br />Connettivita''<br />Wi-Fi - Bluetooth - Micro USB - NFC<br /><br />GPS<br />Integrato<br /><br />Display<br />5.2" 16 Milioni colori Touch<br /><br />Fotocamera<br />20 Mpixel/Flash<br /><br />Memoria Interna<br />32 GB<br /><br />Slot Memory Card<br />Micro SD fino a 2TB<br /><br />Processore<br />HexaCore 1.8 GHz<br /><br />Formato SIM<br />Nano<br /><br />Video<br />Video Recorder e Playback<br /><br />Musica<br />MP3 Player<br /><br />Dimensioni<br />45x73,2x8,25 mm<br /><br />Peso<br />150 grammi<br />Autonomia<br />Stand-by fino a 275 ore - Conversazione fino a 1080 min.</p>', 1, 1),
(6, 'Galaxy Gear Fit', NULL, 10.01, 'Samsung', 'Salute e benessere', 'Tv e smart life', '<p>Il Samsung Gear Fit e'' uno smartwatch prodotto da Samsung Electronics, e fa parte della famiglia di smartwatch Samsung Gear. E'' equipaggiato di un display AMOLED curvo ed e'' concepito per il monitoraggio dell''attivita'' fisica.</p>', '<p>Il Samusng Galaxy Gear Fit e'' progettato in particolare per il fitness ed ha applicazioni quali:<br />misuratore di battito cardiaco.<br />pedometro.<br />applicazioni di misura per attivita'' quali Camminata, Corsa, Ciclismo, Hiking.<br />applicazioni monitoraggio Sonno e Stress.</p>', '<p>Connettivita'':<br />Versione Bluetooth: Bluetooth v4.0<br />Profili Bluetooth: SPP, GATT<br /><br />Display:<br />Tecnologia: Super AMOLED Touch Screen curvo<br />Dimensioni: 1.84" (46,6 mm)<br />Risoluzione: 128 x 432</p>', 0, 1),
(7, 'iPad Pro', 'Bianco', 1249.90, 'Apple', 'iOS', 'Tablet', '<p>Scopri l''iPad migliore di sempre.<br />iPad pro.</p>', '<p>Con iPad hai scoperto un mondo completamente nuovo, semplice e coinvolgente. Oggi iPad Pro, con la tecnologia MultiTouch perfezionata, il suo grande display Retina da 12,9" e prestazioni della CPU quasi raddoppiate rispetto a iPad Air 2, e'' pronto ad allargare ancora una volta i tuoi orizzonti. Non e'' solo piu'' grande. e'' un iPad che ti permettera'' di lavorare e creare in una dimensione tutta nuova, come non hai mai fatto prima.</p>', '<p>Capacita'': 128,256 GB<br />Dimensioni: 220,6mm x 305,7mm x 6,9<br />Peso: 713 grammi.<br />Display: Display Retina<br />Multi-Touch retroilluminato LED da 9,7" (diagonale)<br />Risoluzione di 2048x1536 pixel a 264 ppi<br />Ampia gamma cromatica<br />Display True Tone<br />Rivestimento oleorepellente a prova di impronte<br />Display a laminazione completa<br />Rivestimento antiriflesso<br />Processore: Chip A9X con architettura a 64 bit<br />Coprocessore: M9<br />Fotocamera: Fotocamera iSight da 8 megapixel<br />Autofocus<br />Panorama (fino a 43 megapixel)<br />HDR per le foto<br />Controllo dell''esposizione</p>', 1, 0),
(8, 'Mediapad T1 10 LTE', 'Bianco', 249.90, 'Huawei', 'Android', 'Tablet', '<p>Huawei T1 sottile tablet di entry level, offre un buon compromessom tra prezzo e prestazioni</p>', '<p>Design<br />Disponibile nella sola colorazione bianca, il Huawei T1 e'' piuttosto sottile(solo 8,3 mm), cio'' lo rende utilizzabile con una sola mano.<br /><br />Display<br />Display da 9.6" con una risoluzione di 1280X800 pixel ed una densita'' di 160ppi offre una buona esperienza ottimale.<br /><br />Caratteristiche<br />Il Huawei MediaPad T1 10 e'' equipaggiato con processore quad core da 1,2 GHz di Qualcomm e 1 GB di RAM. La memoria interna e'' di soli 16 GB, espandibile con schede microSD. E'' presente anche il supporto all''USB On-The-Go, quindi e'' possibile collegare memorie esterne nel caso in cui si necessiti di una maggiore quantita'' di storage.<br />Sul lato connettivita'' e'' ben fornito, con una dotazione Wi-Fi 802.11 b/g/n dual band 2,4/5 GHz e un comparto telefonico che fa uso di una MicroSIM con tecnologia LTE di categoria 4 (fino a 150 Mbps in download e 50 Mbps in upload) e Voice HD per le chiamate. Per accedere alle funzioni telefoniche occorrono le cuffie.</p>', '<p>Display 9.6" (1280x800) IPS 16M di colori<br />Sistema Operativo Android 4.4 KitKat<br />Connettivita<br />LTE, HSDPA+ 42.2Mbps/HSUPA 5.76/, Wi-Fi 802.11b/g/n, Bluetooth 3.0<br /><br />Display<br />9.6" (1280x800) IPS 16M di colori<br /><br />Video/Audio/Picture<br />2 Fotocamera da 5 Mpx e VGA<br />Lettore multimediale - MP3, WAV, 3GP, AAC, AAC+ e-AAC+, JPG, PNG,GIF, BMP, WMV, H264, Mpeg4, 1080p/30fps<br /><br />Memoria<br />8GB (espandibile fino a 64GB)<br /><br />Processore<br />Quad-core 1.2GHz<br /><br />SistemaOperativo<br />AndroidTM 4.4 KitKat<br /><br />Dimensioni<br />248,5 x 150 x8,3 mm<br /><br />Peso<br />433 grammi<br /><br />Autonomia<br />Stand-by fino a 300h</p>', 0, 0),
(9, 'Smart TV 50"', NULL, 938.88, 'Samsung', 'Tv e smart life', 'Tv e smart life', '<p>Nuova smart TV di samsung da 50"</p>', '<p>Incredibile TV con colori accesi e brillanti!<br />Sempre connessa ad internet e con moltissime app aggiornate.</p>', '<p>Sesta serie:<br />Display da 50"<br />Ultra clear panel<br />Risoluzione 3840x2160 pixel<br />Smart TV<br />App presenti: Netflix, Sky online, TIM vision,Infinity,Skype e molte altre</p>', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_assistenza`
--

CREATE TABLE IF NOT EXISTS `prodotti_assistenza` (
  `id_prodotto` int(11) NOT NULL,
  `id_assistenza` int(11) NOT NULL,
  PRIMARY KEY (`id_prodotto`,`id_assistenza`),
  KEY `id_assistenza` (`id_assistenza`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prodotti_assistenza`
--

INSERT INTO `prodotti_assistenza` (`id_prodotto`, `id_assistenza`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 3),
(2, 4),
(2, 6),
(3, 10),
(3, 11),
(4, 7),
(4, 8),
(4, 9),
(6, 12),
(6, 13),
(7, 1),
(7, 2),
(7, 5),
(8, 3),
(8, 4),
(8, 6),
(9, 12),
(9, 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_servizi`
--

CREATE TABLE IF NOT EXISTS `prodotti_servizi` (
  `id_prodotto` int(11) NOT NULL,
  `id_servizio` int(11) NOT NULL,
  PRIMARY KEY (`id_prodotto`,`id_servizio`),
  KEY `id_servizio` (`id_servizio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prodotti_servizi`
--

INSERT INTO `prodotti_servizi` (`id_prodotto`, `id_servizio`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 4),
(3, 8),
(4, 1),
(4, 4),
(4, 8),
(6, 1),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 8),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 8),
(9, 4),
(9, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizi`
--

CREATE TABLE IF NOT EXISTS `servizi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `categoria` varchar(30) NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `descrizione` longtext NOT NULL,
  `offerta` longtext,
  `dettagli_costi` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `servizi`
--

INSERT INTO `servizi` (`id`, `nome`, `categoria`, `img`, `descrizione`, `offerta`, `dettagli_costi`) VALUES
(1, 'Tim Music', 'Entertainment', 'img/timmusic.png', '<p>Ascolta milioni di brani in streaming, tutte le novita'' discografiche, anteprime esclusive e tante playlist di tutti i generi. Su smartphone senza consumare GB, pc e tablet. Quando vuoi e quanto vuoi.</p>', '<p>Ogni settimana la classifica dei 20 brani piu'' ascoltati su TIM Music.</p>\r\n<p>Tante playlist create per accompagnare ogni momento della tua giornata</p>\r\n<p>Tutte le novita'' discografiche nazionali e internazionali, spesso in anteprima esclusiva</p>', '<p>Attiva subito TIM Music al costo di 4.99 euro al mese. Puoi farlo anche dall''app, direttamente dal tuo dispositivo!</p>'),
(2, 'Tim Games', 'Entertainment', 'img/timgames.png', '<p>Sparatutto, sport estremi, i migliori Classici e molto altro ancora... Con TIM Games hai a disposizione centinaia di giochi per il tuo smartphone e tablet, per divertirti dove e quando vuoi.</p>', '<p>Il traffico Internet per la navigazione e il download dei giochi e'' sempre incluso per i clienti TIM che accedono dall''Italia attraverso Rete 3G/4G</p>\r\n<p>Costi promozione I Love Games Promo: l''offerta I Love Games Promo ti consente di scegliere tutti i giochi che vuoi sul tuo smartphone e giocare illimitatamente. Il costo del primo mese e'' a meta'' prezzo, a solo 1 euro a settimana. Poi il servizio resta attivo a 2 euro a settimana, salvo disattivazione che si puo'' richiedere in qualsiasi momento e gratuitamente al Servizio Clienti 119. Per usufruire del servizio scarica gratis l''app TIMgames o vai tramite il tuo smartphone su timgames.it. Il traffico Internet per il download dei giochi e'' incluso! Verifica di avere un telefono compatibile su questo sito.</p>', '<p>Con I Love Games Promo puoi scaricare tutti i giochi che vuoi dall''app TIMgames.<br />Per il primo mese il servizio in abbonamento sara'' a meta'' prezzo, al costo di 1 euro a settimana, poi passera'' in automatico a 2 euro a settimana.<br />In piu'', il traffico dati per scaricare i giochi e'' incluso nell''abbonamento!</p>'),
(3, 'Tim Reading', 'Entertainment', 'img/timreading.png', '<p>Porta sempre con te su Smartphone e Tablet i tuoi eBook preferiti, segui tutte le tue passioni scegliendo tra i magazine piu'' amati e sfoglia il tuo quotidiano dalle prime ore del mattino. Su TIM Reading trovi cio'' che ami leggere, dove e quando vuoi.</p>', '<p>Vuoi essere informato dalle prime ore del mattino? Con l''offerta Sfoglio Digitale TIM puoi leggere i tuoi giornali preferiti ogni giorno sul tuo PC, tablet o smartphone. Il meglio dell''informazione e'' sempre con te.</p>\r\n<p><br />Scegli tra le principali testate giornalistiche italiane complete di allegati ed edizioni locali: Corriere della Sera, la Repubblica, Il Messaggero, La Gazzetta dello Sport, La Stampa, Il Mattino, Il Gazzettino, Il Corriere Adriatico,Il Nuovo Quotidiano di Puglia, La Nazione, Il Resto del Carlino e il Giorno.</p>', 'E con TIM acquisti in carta di credito e il primo mese e'' gratis!<br />\r\nScopri i dettagli dell''offerta di ciascun giornale e acquista online o nei Negozi TIM.'),
(4, 'Netflix', 'TV', 'img/netflix.jpg', 'Serie Tv e film a partire da 7,99 euro/mese, dove vuoi e quando vuoi, anche il decoder TIM Vision', '<p>Scopri nuove storie!<br />Serie originali, commedie, drammi e programmi per bambini, puoi guardare le tue serie TV e film preferiti in streaming istantaneo sul dispositivo che preferisci. L''offerta TV che aspettavamo da tempo per la grande varieta'' dei contenuti, da vedere quando e dove vuoi con qualita'' della Rete TIM e senza vincoli, disponibile direttamente sulla TV di casa anche attraverso il decoder TIM Vision con la qualita'' HD. </p>', '<p>Con TIM Vision ti godi lo spettacolo di Netflix anche sulla TV di casa.<br />Con TIM accedi al mondo Netflix in maniera facile e immediata con il decoder TIM Vision. Per i clienti TIM non occorre alcuna carta di credito per Netflix. Paghi comodamente sulla fattura TIM e mantieni sotto controllo le spese. Puoi guardare Netflix in qualsiasi momento, senza interruzioni pubblicitarie. Un''esperienza facile e veloce con tre pacchetti da scegliere in abbonamento.</p>'),
(5, 'Trasporti', 'Servizi alla persona', 'img/trasporti.jpg', 'Acquista i biglietti dei trasporti della tua citta'', attraverso il servizio SMS ticketing. Verifica subito se il servizio e'' gia'' disponibile nella tua citta''!', '<p>Apri TIM Wallet e accedi alla Vetrina Servizi. <br />Se la citta'' che ti interessa e'' abilitata, clicca e acquista il biglietto. <br />Paghi direttamente con il tuo credito telefonico (se sei un Cliente Ricaricabile) o con addebito in bolletta (se sei un Cliente con Abbonamento).</p>', '<p>Attenzione, il servizio ha un costo di 19.90 centesimi a SMS. Dal momento in cui ricevi l''SMS il biglietto e'' considerato valido. Puoi trovare il biglietto elettronico direttamente nel tuo TIM Wallet.</p>'),
(6, 'Pagamenti', 'Servizi alla persona', 'img/pagamenti.jpg', 'Scegli le carte di pagamento di Intesa Sanpaolo, UBI o Mediolanum: pagare e'' semplice e conveniente', '<p>Scopri subito TIM SmartPAY, la carta prepagata nata dalla partnership fra Intesa Sanpaolo e TIM dedicata a tutti i clienti TIM, oppure scegli la carta di pagamento che preferisci tra quelle disponibili di Intesa Sanpaolo, UBI Banca, Mediolanum, BNL o Hello bank!</p>', 'TIM SmartPAY e'' la carta di pagamento prepagata conveniente e sicura, realizzata in collaborazione con Intesa Sanpaolo e VISA.\r\nLa TIM SmartPAY e'' una carta dedicata ai clienti TIM.\r\nPuoi richiederla ed utilizzarla sin da subito per fare acquisti con il tuo smartphone NFC e su Internet.'),
(7, 'Tim Tag', 'Casa e famiglia', 'img/timTag.jpg', 'TIM Tag e'' il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te piu'' care. \r\nSegui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista.', '<p>TIM Tag e'' il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te piu'' care.</p>\r\n<p>Segui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista.<br />Con TIMTag hai un dispositivo di localizzazione GPS di ultima generazione, con 12 mesi di servizio TIMTag e una TIM Card inclusi e un''App dedicata intuitiva e semplice da utilizzare!</p>', '<p>TIM Tag puo'' essere tuo in abbonamento a 9,90 euro al mese. Attivalo subito dall''app TIM.</p>'),
(8, 'TIM Vision', 'TV', 'img/timvision.png', '<p>Cartoni, cinema, serie tv, documentari e concerti sempre on demand per creare il tuo palinsesto senza pubblicita''. Piu'' di 8.000 titoli in un abbonamento, senza vincoli di durata, anche in HD</p>', '<p>Tutti gli episodi delle migliori serie TV, dalle piu'' famose alle piu'' esclusive, disponibili immediatamente e da vedere tutte d''un fiato e, per non interrompere la tua maratona, puoi guardare TIM Vision anche sul WEB, su Smartphone e Tablet</p>\r\n<p>I cartoni animati e le serie preferite da bambini e ragazzi, finalmente senza interruzioni pubblicitarie. Una ricca offerta che soddisfa ogni eta'', dai piu'' piccoli ai piu'' grandi, con la sicurezza del Parental Control.</p>\r\n<p>Una ricca offerta con i migliori documentari per attraversare luoghi incontaminati ed avere uno sguardo attento alla natura, rivedere la grande storia del passato per aiutarci a non dimenticare e incontrare personaggi famosi comodamente a casa</p>', '<p>Una ricca proposta di film con le anteprime piu'' attese, i grandi classici, inediti, film d''azione, thriller, animazione e commedie per tutta la famiglia. In piu'' l''HD, per rendere ogni immagine spettacolare e non perdere neanche un particolare</p>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
