package testFramework.com.testframework;

import framework.annotation.AnnotationReader;

public class Main {
    
    public static void main(String[] args) {
        System.out.println("=== Test des annotations ===\n");
        
        // Le scan du package de base est fait automatiquement par AnnotationReader
        // Le package de base est défini dans testFramework/resources/config.properties
        AnnotationReader.displayClassesWithAnnotations();
    }
}
