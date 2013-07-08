//
//  ViewController.m
//  XMLParserExample
//
//  Created by Virginia Armas on 7/7/13.
//  Copyright (c) 2013 Synergy-GB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize currentElementValue = _currentElementValue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self parsearXML];
}

- (void) parsearXML {
    NSString *xml = @"<pruebas><prueba><nombrePrueba>Nombre1</nombrePrueba><atributoPrueba>Valor atributo</atributoPrueba></prueba></pruebas>";
    
    NSData* dataXML = [xml dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:dataXML];
    [nsXmlParser setDelegate:self];
    
    BOOL success = [nsXmlParser parse];
    
    if (success) {
        NSLog(@"No hubo errores");
    } else {
        NSLog(@"Error en el parseo de XML");
    }

}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"prueba"]) {
        NSLog(@"Se encontro un elemento de tipo prueba");
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!_currentElementValue) {
        _currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        [_currentElementValue appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"pruebas"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"prueba"]) {
        // Se termino con el elemento actual
    } else {
        // El parser esta procesando uno de los valores del elemento actual
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
