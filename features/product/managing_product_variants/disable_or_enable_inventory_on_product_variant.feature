@managing_product_variants
Feature: Toggle the inventory tracking
    In order to have the inventory tracked in my shop
    As an Administrator
    I want to toggle the inventory tracking

    Background:
        Given the store is available in "English (United States)"
        And the store has a "Wyborowa Vodka" configurable product
        And the product "Wyborowa Vodka" has "Wyborowa Vodka Exquisite" variant priced at "$40.00"
        And I am logged in as an administrator

    @ui
    Scenario: Disabling inventory for a product variant
        Given the "Wyborowa Vodka Exquisite" product variant is tracked by the inventory
        And I want to modify the "Wyborowa Vodka Exquisite" product variant
        When I disable its inventory tracking
        And I save my changes
        Then I should be notified that it has been successfully edited
        And inventory of this variant should not be tracked

    @ui
    Scenario: Enabling inventory for a product variant
        Given I want to modify the "Wyborowa Vodka Exquisite" product variant
        When I enable its inventory tracking
        And I save my changes
        Then I should be notified that it has been successfully edited
        And inventory of this variant should be tracked
