package networks;

import ned.DatarateChannel;
import ned.IdealChannel;
import modules.*;
import modules.Backend.Backend;
import modules.Logger.Logger;
import channels.*;

network Rede1
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
    submodules:
        backend: Backend;
        logger: Logger;
        Alice: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=95.52,133.33,m,5,60,60");
        }

        Bob: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=372.13,133.33,m,5,60,60");
        }
        HOM: HOM {
            address = 2;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=164.175,134.325,m,5,60,60");
        }
        Router: QNode {
            address = 3;
            //@display("p=246,56");
            @display("i=RTR;p=253.72499,134.325,m,5,60,60");
        }

    connections:

        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> HOM.port++;
        Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> HOM.quantum_port++;

        HOM.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        HOM.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;

        Router.port++ <--> ClassicalChannel {  distance = 10km; } <--> Bob.port++;
        Router.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Bob.quantum_port++;
}



network Anel
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
        @display("bgb=743,278");
    submodules:
        //4 nós
        backend: Backend {
            @display("p=603,37");
        }
        logger: Logger {
            @display("p=596,135");
        }
        Alice: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=42,134,m,5,60,60");
        }

        Bob: QNode {
            address = 2;
            node_type = "EndNode";
            @display("i=COMP;p=183,51,m,5,60,60");
        }

        Charlie: QNode {
            address = 3;
            node_type = "EndNode";
            @display("i=COMP;p=387,51,m,5,60,60");
        }


        Dave: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=254,183,m,5,60,60");
        }

        BSAab: HOM {
            address = 5;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=99,59,m,5,60,60");
        }

        BSAbc: HOM {
            address = 6;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=271,52,m,5,60,60");
        }

        BSAcd: HOM {
            address = 7;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=397,170,m,5,60,60");
        }

        BSAda: HOM {
            address = 8;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=122,184,m,5,60,60");
        }




    connections:
        //Alice-Homab
        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAab.port++;
        Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAab.quantum_port++;

        //Homab-Bob
        BSAab.port++ <--> ClassicalChannel {  distance = 10km; } <--> Bob.port++;
        BSAab.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Bob.quantum_port++;


        //Bob-Hombc
        Bob.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAbc.port++;
        Bob.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAbc.quantum_port++;

        //Hombc- Charlie
        BSAbc.port++ <--> ClassicalChannel {  distance = 10km; } <--> Charlie.port++;
        BSAbc.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Charlie.quantum_port++;

    //Charlie-Homcd

        Charlie.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAcd.port++;
        Charlie.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAcd.quantum_port++;

    //Homcd- 

        BSAcd.port++ <--> ClassicalChannel {  distance = 10km; } <--> Dave.port++;
        BSAcd.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Dave.quantum_port++;

        //Dave.Homda 
        Dave.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAda.port++;
        Dave.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAda.quantum_port++;

        //Homda- 
        BSAda.port++ <--> ClassicalChannel {  distance = 10km; } <--> Alice.port++;
        BSAda.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> Alice.quantum_port++;


}


network Estrela
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
        @display("bgb=743,278");
    submodules:
        //4 nós
        backend: Backend {
            @display("p=603,37");
        }
        logger: Logger {
            @display("p=596,135");
        }
        Alice: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=42,134,m,5,60,60");
        }

        Bob: QNode {
            address = 2;
            node_type = "EndNode";
            @display("i=COMP;p=183,51,m,5,60,60");
        }

        Charlie: QNode {
            address = 3;
            node_type = "EndNode";
            @display("i=COMP;p=387,51,m,5,60,60");
        }


        Dave: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=416,172,m,5,60,60");
        }

        Router: QNode {
            address = 5;
            node_type = "Router";
            @display("i=RTR;p=242,155");
        }

    connections:
        //Alice-Homab
        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        Alice.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;

        Bob.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        Bob.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;

        Charlie.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        Charlie.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;

        Dave.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        Dave.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;
}




network Arvore
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
        @display("bgb=743,278");
    submodules:
        //4 nós
        backend: Backend {
            @display("p=603,37");
        }
        logger: Logger {
            @display("p=596,135");
        }
        Alice: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=39,183,m,5,60,60");
        }

        Bob: QNode {
            address = 2;
            node_type = "EndNode";
            @display("i=COMP;p=112,202,m,5,60,60");
        }

        Charlie: QNode {
            address = 3;
            node_type = "EndNode";
            @display("i=COMP;p=171,202,m,5,60,60");
        }


        Dave: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=315,202,m,5,60,60");
        }
        Echo: QNode {
            address = 5;
            node_type = "EndNode";
            @display("i=COMP;p=378,202,m,5,60,60");
        }

        Fox: QNode {
            address = 6;
            node_type = "EndNode";
            @display("i=COMP;p=441,202,m,5,60,60");
        }

        Router: QNode {
            address = 8;
            node_type = "Router";
            @display("i=RTR;p=248,48");
        }

        Repeater1: QNode {
            address = 9;
            node_type = "Repeater";
            @display("i=REP1G;p=119,107,m,5,60,60");
        }

        Repeater2: QNode {
            address = 10;
            node_type = "Repeater";
            @display("i=REP1G;p=379,113,m,5,60,60");
        }


    connections:
         //Alice-Homab
        //Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAab.port++;
        //Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAab.quantum_port++;

        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Bob.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Charlie.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Dave.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Echo.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Fox.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Repeater1.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;
        Repeater2.port++ <--> ClassicalChannel {  distance = 10km; } <--> Router.port++;

        Alice.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Bob.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Charlie.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Repeater1.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;
        Repeater2.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Router.quantum_port++;
        Dave.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
        Echo.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
        Fox.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
}



network Barra
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
        @display("bgb=743,278");
    submodules:
        //4 nós
        backend: Backend {
            @display("p=603,37");
        }
        logger: Logger {
            @display("p=596,135");
        }
        Alice: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=120,134,m,5,60,60");
        }

        Bob: QNode {
            address = 2;
            node_type = "EndNode";
            @display("i=COMP;p=206,62,m,5,60,60");
        }

        Charlie: QNode {
            address = 3;
            node_type = "EndNode";
            @display("i=COMP;p=296,62,m,5,60,60");
        }


        Dave: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=389,62,m,5,60,60");
        }

        Repeater1: QNode {
            address = 9;
            node_type = "Repeater";
            @display("i=REP1G;p=207,135,m,5,60,60");
        }

        Repeater2: QNode {
            address = 9;
            node_type = "Repeater";
            @display("i=REP1G;p=297,135,m,5,60,60");
        }

        Repeater3: QNode {
            address = 9;
            node_type = "Repeater";
            @display("i=REP1G;p=382,135,m,5,60,60");
        }

        Echo: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=206,212,m,5,60,60");
        }

        Fox: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=287,222,m,5,60,60");
        }

        Golf: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=381,212,m,5,60,60");
        }

        Hotel: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=465,134,m,5,60,60");
        }

    connections:

      //Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAab.port++;
        //Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAab.quantum_port++;

        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Bob.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Echo.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater1.port++;
        Charlie.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Fox.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Dave.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater3.port++;
        Golf.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater3.port++;
        Hotel.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater3.port++;
        Repeater1.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater2.port++;
        Repeater2.port++ <--> ClassicalChannel {  distance = 10km; } <--> Repeater3.port++;


        Alice.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Echo.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Bob.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater1.quantum_port++;
        Charlie.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
        Fox.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
        Dave.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater3.quantum_port++;
        Golf.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater3.quantum_port++;
        Repeater1.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater2.quantum_port++;
        Repeater2.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater3.quantum_port++;
        Hotel.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Repeater3.quantum_port++;
}
network Topologias
{
    parameters:
        **.speed_of_light_in_fiber = 208189.206944 km;
        @display("bgb=1025,381");
    submodules:
        //4 nós
        backend: Backend {
            @display("p=22,23");
        }
        logger: Logger {
            @display("p=82,23");
        }
        A1: QNode {
            address = 1;
            node_type = "EndNode";
            @display("i=COMP;p=201,307,m,5,60,60");
        }

        A2: QNode {
            address = 2;
            node_type = "EndNode";
            @display("i=COMP;p=290,317,m,5,60,60");
        }

        A3: QNode {
            address = 3;
            node_type = "EndNode";
            @display("i=COMP;p=374,317,m,5,60,60");
        }


        A4: QNode {
            address = 4;
            node_type = "EndNode";
            @display("i=COMP;p=469,317,m,5,60,60");
        }
        A5: QNode {
            address = 5;
            node_type = "EndNode";
            @display("i=COMP;p=547,317,m,5,60,60");
        }

        A6: QNode {
            address = 6;
            node_type = "EndNode";
            @display("i=COMP;p=623,325,m,5,60,60");
        }

        Roteador1: QNode {
            address = 7;
            node_type = "Router";
            @display("i=RTR;p=434,213");
        }

        RP1: QNode {
            address = 8;
            node_type = "Repeater";
            @display("i=REP1G;p=306,254,m,5,60,60");
        }

        RP2: QNode {
            address = 9;
            node_type = "Repeater";
            @display("i=REP1G;p=548,251,m,5,60,60");
        }


        B1: QNode {
            address = 10;
            node_type = "EndNode";
            @display("i=COMP;p=33,136,m,5,60,60");
        }

        B4: QNode {
            address = 12;
            node_type = "EndNode";
            @display("i=COMP;p=165,86,m,5,60,60");
        }

        B3: QNode {
            address = 13;
            node_type = "EndNode";
            @display("i=COMP;p=305,122,m,5,60,60");
        }


        B2: QNode {
            address = 14;
            node_type = "EndNode";
            @display("i=COMP;p=138,194,m,5,60,60");
        }

        BSA1: HOM {
            address = 11;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=104,87,m,5,60,60");
        }

        BSA2: HOM {
            address = 15;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=228,87,m,5,60,60");
        }

        BSA3: HOM {
            address = 17;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=219,195,m,5,60,60");
        }

        BSA4: HOM {
            address = 18;
            node_type = "BSA";
            //@display("p=326,57");
            @display("p=69,195,m,5,60,60");
        }


        Alice: QNode {
            address = 16;
            node_type = "EndNode";
            @display("i=COMP;p=666,110,m,5,60,60");
        }

        Bob: QNode {
            address = 19;
            node_type = "EndNode";
            @display("i=COMP;p=742,36,m,5,60,60");
        }

        Charlie: QNode {
            address = 20;
            node_type = "EndNode";
            @display("i=COMP;p=811,36,m,5,60,60");
        }


        Dave: QNode {
            address = 21;
            node_type = "EndNode";
            @display("i=COMP;p=896,44,m,5,60,60");
        }

        RP3: QNode {
            address = 22;
            node_type = "Repeater";
            @display("i=REP1G;p=732,110,m,5,60,60");
        }

        RP4: QNode {
            address = 23;
            node_type = "Repeater";
            @display("i=REP1G;p=812,110,m,5,60,60");
        }

        RP5: QNode {
            address = 24;
            node_type = "Repeater";
            @display("i=REP1G;p=890,110,m,5,60,60");
        }

        Echo: QNode {
            address = 25;
            node_type = "EndNode";
            @display("i=COMP;p=731,177,m,5,60,60");
        }

        Fox: QNode {
            address = 26;
            node_type = "EndNode";
            @display("i=COMP;p=811,194,m,5,60,60");
        }

        Golf: QNode {
            address = 27;
            node_type = "EndNode";
            @display("i=COMP;p=890,194,m,5,60,60");
        }

        Hotel: QNode {
            address = 28;
            node_type = "EndNode";
            @display("i=COMP;p=949,109,m,5,60,60");
        }

        //Conectando as Topologias
        Roteador2: QNode {
            address = 29;
            node_type = "Router";
            @display("i=RTR;p=456,123");
        }


    connections:
         //Alice-Homab
        //Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAab.port++;
        //Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAab.quantum_port++;

        A1.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP1.port++;
        A2.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP1.port++;
        A3.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP1.port++;
        A4.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP2.port++;
        A5.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP2.port++;
        A6.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP2.port++;
        RP1.port++ <--> ClassicalChannel {  distance = 10km; } <--> Roteador1.port++;
        RP2.port++ <--> ClassicalChannel {  distance = 10km; } <--> Roteador1.port++;

        A1.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP1.quantum_port++;
        A2.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP1.quantum_port++;
        A3.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP1.quantum_port++;
        RP1.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Roteador1.quantum_port++;
        RP2.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Roteador1.quantum_port++;
        A4.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP2.quantum_port++;
        A5.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP2.quantum_port++;
        A6.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP2.quantum_port++;
        //Alice-Homab
        B1.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSA1.port++;
        B1.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSA1.quantum_port++;
        //Homab-Bob
        BSA1.port++ <--> ClassicalChannel {  distance = 10km; } <--> B4.port++;
        BSA1.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> B4.quantum_port++;
        //Bob-Hombc
        B4.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSA2.port++;
        B4.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSA2.quantum_port++;
        //Hombc- Charlie
        BSA2.port++ <--> ClassicalChannel {  distance = 10km; } <--> B3.port++;
        BSA2.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> B3.quantum_port++;
        //Charlie-Homcd
        B3.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSA3.port++;
        B3.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSA3.quantum_port++;
        //Homcd- 
        BSA3.port++ <--> ClassicalChannel {  distance = 10km; } <--> B2.port++;
        BSA3.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> B2.quantum_port++;
        //Dave.Homda 
        B2.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSA4.port++;
        B2.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSA4.quantum_port++;
        //Homda- 
        BSA4.port++ <--> ClassicalChannel {  distance = 10km; } <--> B1.port++;
        BSA4.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> B1.quantum_port++;


      //Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> BSAab.port++;
        //Alice.quantum_port++ <--> QuantumChannel {  distance = 10km; } <--> BSAab.quantum_port++;

        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP3.port++;
        Bob.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP3.port++;
        Echo.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP3.port++;
        Charlie.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP4.port++;
        Fox.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP4.port++;
        Dave.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP5.port++;
        Golf.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP5.port++;
        Hotel.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP5.port++;
        RP3.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP4.port++;
        RP4.port++ <--> ClassicalChannel {  distance = 10km; } <--> RP5.port++;


        Alice.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP3.quantum_port++;
        Echo.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP3.quantum_port++;
        Bob.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP3.quantum_port++;
        Charlie.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP4.quantum_port++;
        Fox.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP4.quantum_port++;
        Dave.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP5.quantum_port++;
        Golf.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP5.quantum_port++;
        RP3.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP4.quantum_port++;
        RP4.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP5.quantum_port++;
        Hotel.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> RP5.quantum_port++;


        //Conetando as topologias
        B3.port++ <--> ClassicalChannel {  distance = 10km; } <--> Roteador2.port++;
        Roteador1.port++ <--> ClassicalChannel {  distance = 10km; } <--> Roteador2.port++;
        Alice.port++ <--> ClassicalChannel {  distance = 10km; } <--> Roteador2.port++;
        
        
        B3.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Roteador2.quantum_port++;
        Roteador1.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Roteador2.quantum_port++;
        Alice.quantum_port_receiver++ <--> QuantumChannel {  distance = 10km; } <--> Roteador2.quantum_port++;



}

