#include "leerInput.h"

void mapearDigitos(char *numero,int *numeroEntero);

void mapearLetras(char *numero,int *numeroEntero);

void mostrarAyuda();

int* esNumeroValido(char* numero, int* base);


int* inputValido(char *argv[], int *cantArg, char *numEntero, char *numFraccionario, int *origen, int *destino, int *v)
{
    int *i;
    int *j;
    int *aux;
    int *iPunto;
    int *numeroPos;
    int *esValido;
    i = (int*)malloc(sizeof(int));
    j = (int*)malloc(sizeof(int));
    esValido = (int*)malloc(sizeof(int));

    *esValido = 0;
    if(*cantArg>1 && *cantArg<10)  //Como minimo, debe ser: convert -h, como maximo tendra los 9 parametros.
    {
        *i = 1;
        while(*i<*cantArg)              //Primero me fijo si hay un -h.
        {
            if(strcmp(argv[*i],"-h")==0)
            {
                mostrarAyuda();
                exit(EXIT_SUCCESS);
            }
            *i = *i + 1;
        }
        *i = 1;
        *j = 0;
        aux = (int*)malloc(sizeof(int));        //A partir de aca me fijo si se respeta el formato del enunciado.
        numeroPos = (int*)malloc(sizeof(int));
        *numeroPos = 0;
        while(*i<*cantArg)     //En cada argumento, me fijo si es de algun tipo del formato del enunciado, a lo que pregunto si se repitio.
        {
            if(strcmp(argv[*i],"-s")==0)
            {
                if(*origen==0)
                {
                    *aux = 10;
                    if((*i+1)<*cantArg && *esNumeroValido(argv[*i+1],aux))
                    {
                        *origen = atoi(argv[*i+1]);
                        if(*origen<2 || *origen>16)
                        {
                            printf("La base origen ingresada no pertenece al rango [2,16].\n");
                            exit(EXIT_FAILURE);
                        }
                        *i = *i + 1;
                    }
                    else
                    {
                        printf("El formato ingresado no es valido.\n");
                        exit(EXIT_FAILURE);
                    }
                }
                else
                {
                    printf("El formato ingresado no es valido.\n");
                    exit(EXIT_FAILURE);
                }
            }
            else if(strcmp(argv[*i],"-d")==0)
            {
                if(*destino==0)
                {
                    *aux = 10;
                    if((*i+1)<*cantArg && *esNumeroValido(argv[*i+1],aux))
                    {
                        *destino = atoi(argv[*i+1]);
                        if(*destino<2 || *destino>16)
                        {
                            printf("La base destino ingresada no pertenece al rango [2,16].\n");
                            exit(EXIT_FAILURE);
                        }
                        *i = *i + 1;
                    }
                    else
                    {
                        printf("El formato ingresado no es valido.\n");
                        exit(EXIT_FAILURE);
                    }
                }
                else
                {
                    printf("El formato ingresado no es valido.\n");
                    exit(EXIT_FAILURE);
                }
            }
            else if(strcmp(argv[*i],"-v")==0)
            {
                if(*v==0)
                    *v = 1;
                else
                {
                    printf("El formato ingresado no es valido.\n");
                    exit(EXIT_FAILURE);
                }
            }
            else if(strcmp(argv[*i],"-n")==0)
            {
                if(*numeroPos==0)
                {
                    if((*i+1)<*cantArg)
                    {
                        *i = *i + 1;
                        *numeroPos = *i;
                    }
                    else
                    {
                        printf("El formato ingresado no es valido.\n");
                        exit(EXIT_FAILURE);
                    }
                }
                else
                {
                    printf("El formato ingresado no es valido.\n");
                    exit(EXIT_FAILURE);
                }
            }
            else
            {
                printf("El formato ingresado no es valido.\n");
                exit(EXIT_FAILURE);
            }
            *i = *i + 1;
        }
        *i = 0;
        if(*origen==0)
            *origen = 10;
        if(*destino==0)
            *destino = 10;

        while(argv[*numeroPos][*i]!='.' && argv[*numeroPos][*i]!='\0')    //Me fijo que el numero respete la cantidad de digitos establecida, 10 para la entera y 5 para la fraccionaria.
            *i = *i + 1;
        if((argv[*numeroPos][*i]=='.' || argv[*numeroPos][*i]=='\0') && *i>10)
        {
            printf("El numero ingresado excede el limite de 10 digitos enteros.\n");
            exit(EXIT_FAILURE);
        }
        iPunto = (int*)malloc(sizeof(int));
        *iPunto = *i;
        while(argv[*numeroPos][*i]!='\0')
            *i = *i + 1;
        if(argv[*numeroPos][*i]=='\0' && ((*i-1)-*iPunto)>5)
        {
            printf("El numero ingresado excede el limite de 5 digitos fraccionarios.\n");
            exit(EXIT_FAILURE);
        }
        *j = 0;
        while(*j<*iPunto)        //Checkeo que la parte entera y la fraccionaria esten en la base origen.
        {
            numEntero[*j] = argv[*numeroPos][*j];
            *j = *j + 1;
        }
        numEntero[*j] = '\0';
        if(*esNumeroValido(numEntero,origen)!=1)
        {
            printf("La parte entera del numero ingresado no respeta la base origen ingresada.\n");
            exit(EXIT_FAILURE);
        }
        *j = 0;
        while(*j<((*i-1)-*iPunto))
        {
            numFraccionario[*j] = argv[*numeroPos][*j+*iPunto+1];
            *j = *j + 1;
        }
        numFraccionario[*j] = '\0';
        if(*esNumeroValido(numFraccionario,origen)!=1)
        {
            printf("La parte fracionaria del numero ingresado no respeta la base origen ingresada.\n");
            exit(EXIT_FAILURE);
        }

        *esValido = 1;
        free(iPunto);
        free(aux);
        free(numeroPos);
    }
    else
    {
        printf("La cantidad de parametros ingresada no es correcta.\n");
        exit(EXIT_FAILURE);
    }

    free(i);
    free(j);
    return esValido;
}

void mapearDigitos(char *numero,int *numeroEntero)
{
    int *i;
    i= malloc(sizeof(int));
    *i=0;
    while(numeroEntero[*i]!=-1)   //Recorro los digitos de numeroEntero, los mapeo a caracter y los ubico en numero.
    {
        switch(numeroEntero[*i])
        {
        case 0:
        {
            numero[*i]='0';
            break;
        }
        case 1:
        {
            numero[*i]='1';
            break;
        }
        case 2:
        {
            numero[*i]='2';
            break;
        }
        case 3:
        {
            numero[*i]='3';
            break;
        }
        case 4:
        {
            numero[*i]='4';
            break;
        }
        case 5:
        {
            numero[*i]='5';
            break;
        }
        case 6:
        {
            numero[*i]='6';
            break;
        }
        case 7:
        {
            numero[*i]='7';
            break;
        }
        case 8:
        {
            numero[*i]='8';
            break;
        }
        case 9:
        {
            numero[*i]='9';
            break;
        }
        case 10:
        {
            numero[*i]='A';
            break;
        }
        case 11:
        {
            numero[*i]='B';
            break;
        }
        case 12:
        {
            numero[*i]='C';
            break;
        }
        case 13:
        {
            numero[*i]='D';
            break;
        }
        case 14:
        {
            numero[*i]='E';
            break;
        }
        case 15:
        {
            numero[*i]='F';
            break;
        }
        }
        *i=*i+1;
    }
    numero[*i]='\0';
    free(i);
}

void mapearLetras(char *numero,int *numeroEntero)
{
    int *i;
    i= malloc(sizeof(int));
    *i=0;
    while(numero[*i]!='\0')   //Recorro los digitos de numero, los mapeo a entero y los ubico en numeroEntero.
    {
        switch(numero[*i])
        {
        case '0':
        {
            numeroEntero[*i]=0;
            break;
        }
        case '1':
        {
            numeroEntero[*i]=1;
            break;
        }
        case '2':
        {
            numeroEntero[*i]=2;
            break;
        }
        case '3':
        {
            numeroEntero[*i]=3;
            break;
        }
        case '4':
        {
            numeroEntero[*i]=4;
            break;
        }
        case '5':
        {
            numeroEntero[*i]=5;
            break;
        }
        case '6':
        {
            numeroEntero[*i]=6;
            break;
        }
        case '7':
        {
            numeroEntero[*i]=7;
            break;
        }
        case '8':
        {
            numeroEntero[*i]=8;
            break;
        }
        case '9':
        {
            numeroEntero[*i]=9;
            break;
        }
        case 'A':
        case 'a':
        {
            numeroEntero[*i]=10;
            break;
        }
        case 'B':
        case 'b':
        {
            numeroEntero[*i]=11;
            break;
        }
        case 'C':
        case 'c':
        {
            numeroEntero[*i]=12;
            break;
        }
        case 'D':
        case 'd':
        {
            numeroEntero[*i]=13;
            break;
        }
        case 'E':
        case 'e':
        {
            numeroEntero[*i]=14;
            break;
        }
        case 'F':
        case 'f':
        {
            numeroEntero[*i]=15;
            break;
        }
        }
        *i=*i+1;
    }
    numeroEntero[*i]=-1;
    free(i);
}

void mostrarAyuda()
{
    printf("\nParametros de invocacion:\n");
    printf("-n <numero>: admite solo positivos, con la parte entera hasta 10 digitos y la fraccionaria hasta 5 digitos, separados por un punto.\n");
    printf("-s <base origen> : admite 2 a 16\n");
    printf("-d <base destino> : admite 2 a 16\n");
    printf("-v : muestra computos intermedios\n");
    printf("-h : muestra este mensaje\n");
    printf("EJ: convert -n 1234.5 -s 8 -d 16 -v\n");
}

int* esNumeroValido(char* numero, int* base)
{
    int *toReturn;
    int *i;
    int *fin;
    toReturn = malloc(sizeof(int));
    i= malloc(sizeof(int));
    fin= malloc(sizeof(int));
    *toReturn = 1;
    *i=0;
    *fin=0;
    switch(*base)   //Obtengo la base en la que se encuentra el numero y verifico si todos sus digitos son aceptados. Esto va a depender de la base en la que se encuentre.
    {
    case 2:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='1')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 3:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='2')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 4:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='3')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 5:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='4')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 6:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='5')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 7:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='6')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 8:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='7')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 9:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='8')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 10:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if(numero[*i]>='0' && numero[*i]<='9')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 11:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || numero[*i]=='A' || numero[*i]=='a')
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 12:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || (numero[*i]>='A' && numero[*i]<='B') || (numero[*i]>='a' && numero[*i]<='b'))
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 13:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || (numero[*i]>='A' && numero[*i]<='C') || (numero[*i]>='a' && numero[*i]<='c'))
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 14:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || (numero[*i]>='A' && numero[*i]<='D') || (numero[*i]>='a' && numero[*i]<='d'))
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 15:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || (numero[*i]>='A' && numero[*i]<='E') || (numero[*i]>='a' && numero[*i]<='e'))
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    case 16:
    {
        while(numero[*i]!='\0' && *fin==0)
        {
            if((numero[*i]>='0' && numero[*i]<='9') || (numero[*i]>='A' && numero[*i]<='F') || (numero[*i]>='a' && numero[*i]<='f'))
                *i=*i+1;
            else
            {
                *fin=1;
                *toReturn=0;
            }
        }
        break;
    }
    }
    free(i);
    free(fin);
    return toReturn;
}

