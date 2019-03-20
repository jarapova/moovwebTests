#Feature: This test suite declines Annieselke happy path.


  Happy path flow:

  Open hamburger menu and navigate to subcategory===========================Done
  User is able to reach Account page from hamburger menu====================Done
  Navigate to PDP from "Press" catalog======================================Done
  Navigate to PDP from "Collections" page===================================Done
  Navigate to PDP from "No Results" page====================================Done
  Navigate to PDP from search results=======================================Done
  Navigate to PDP from product suggestions (Complete the look)==============Done
  Navigate to PDP from product suggestions (Related products)===============Done
  Navigate to PDP from  "Ideas, Inspirations" page==========================Done
  Navigate to "Catalogs" page===============================================Done
  Find a store using "Store Finder"=============================================
  Apply filter to see filtered results==========================================
  Click on logo to navigate homepage============================================
  Homepage contains expected content======================================= Done
  Use navigation from home page to go to carousel options=======================
  Navigate to subcategory page using main navigation carousel===================
  Navigate to PDP page==========================================================
  Add item to cart==============================================================
  Use search term to see search results=========================================
  Open cart page================================================================
  Start checkout================================================================
 User is able to visit "Shop Insta" page========================================




#  Open hamburger menu and navigate to subcategory
  Scenario: As User and Guest I want to use Hamburger menu and be navigated to each appropriate page
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And user can see Navigation content in Hamburger menu
    And user able to use Hamburger menu to navigate to appropriate "Pajamas" subcategory page of category "Sleepwear"
    Then user is on "Pajamas" subcategory page



  # User is able to reach account page from hamburger menu
  Scenario: As user and guest I want to reach account page from hamburger menu
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And user click on Login in the top of hamburger menu
    Then user on Login page
    And user enter valid email and password
    And user press "Log in" button
    And user click on Hamburger menu icon in header
    Then user is able to see account tab
    Then user click on "My account" in the top of hamburger menu
    And user on "My account" page
    Then user click on logo to navigate homepage
    And user click on Hamburger menu icon in header
    Then user is able to see account tab
    Then user click on "Logout" in the top of hamburger menu
    And  user click on Login in the top of hamburger menu
    Then user on Login page


 # Navigate to PDP from "Press" catalog
    Scenario: As user I want to navigate to PDP from "Press" catalog page
      Given user is on homepage
      When user click on Hamburger menu icon in header
      And user click on "The company" category
      And user click on "Press" subcategory
      Then user is on "Press" catalog page
      And user press on random catalog
      Then user is on PLP page
      Then user navigating to PDP by clicking random product image


  #  Navigate to PDP from "Collections" page
  Scenario: As user I want to navigate to PDP from "Collections" catalog page
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And user click on "Collections" category
    And user click on "Featured collections" subcategory
    And user click on "All collections" subcategory
    Then user is on "All collections" page
    And user press on random collection
    Then user is on PLP page
    Then user navigating to PDP by clicking random product image

  # Navigate to PDP from "No Results" page
  Scenario: As user I want to navigate to PDP from "No Results" page
    Given user is on homepage
    When user click on search icon header
    And user enter not valid search request
    And press on "search" button
    And user is on "No Results" page
    Then user navigating to PDP by clicking random product image


  # Navigate to PDP from search results
  Scenario: As user I want to navigate to PDP from search results page
    Given user is on homepage
    When user click on search icon header
    And user enter valid search request
    And press on "search" button
    And user is on Search results page
    Then user navigating to PDP by clicking random product image

  # Navigate to PDP from product suggestions (Complete the look)
  Scenario: As user I want to navigate to PDP from from product suggestions
    Given user is on PDP
    When user is able to see "Complete the look" bar
    And user press on random product image in "Complete the look" bar
   Then user is on PDP

# Navigate to PDP from product suggestions (Related products)
  Scenario: As user I want to navigate to PDP from from product suggestions
    Given user is on PDP
    When user is able to see "Related products" bar
    And user press on random product image in "Related products" bar
    Then user is on PDP



   # Navigate to PDP from "Ideas, Inspirations" page
  Scenario: As user I want to navigate to PDP from  "Ideas, Inspirations" page
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And user click on "Ideas, Inspirations" link in the bottom of Hamburher menu
    And user click on random gallery category
    And user click on random gallery subcategory
    Then user is on PLP page
    Then user navigating to PDP by clicking random product image


   # Navigate to "Catalogs" page
  Scenario: As user I want to navigate to "Catalogs" page
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And press on "The company" category
    And press on "Catalog" subcategory
    Then user open random catalog


  # Find a store using "Store Finder"
  Scenario: As user I want to find a store using "Store Finder"
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And press on "Stores" category
    And press on "Find a store" subcategory
    Then user appears on store finder page
    And user enter valid "City"
    And user chose random store brand
    And user press Search button
    Then user can see founded stores list
    And user enter valid "State"
    And user chose random store brand
    And user press Search button
    Then user can see founded stores list
    Then list of founded stores was changed
    And user enter valid "ZIP"
    And user chose random store brand
    And user press Search button
    Then user can see founded stores list
    Then list of founded stores was changed


 # Apply filter to see filtered results
    Given user is on homepage
    When user click on Hamburger menu icon in header
    And user can see Navigation content in Hamburger menu
    And user able to use Hamburger menu to navigate to appropriate "Pajamas" subcategory page of category "Sleepwear"
    Then user is on "Pajamas" subcategory page
    And user can see all items in subcategory
    Then user open filter
    And user selects random filter options
    And user press 'View Results' button on filter pop up
    And user can see items list with applied filter
    And current items count become less or equal with filter applyed
    Then user open  filter
    And user clears filter selection
    And user press 'View Results' button on filter pop up
    And user can see all items in subcategory
    And  current items count is expected without filter appllied
    Then user open size filter
    And user selects two random filter options
    And user press 'View Results' button on filter pop up
    And user can see items list with applied filter
    And current items count become less or equal with filter applyed
    Then user open filter
    And user clears filter selection
    And user press 'View Results' button on filter pop up
    And  current items count is expected without filter appllied

    #  Click on logo to navigate homepage
  Scenario: As user I can press on logo in header and be navigated to homepage
    And user click on logo in header and then redirected to homepge



#  Homepage contains expected content
  Scenario: As Existing User I want to see content specified on Home page
    Given user is on homepage
    Then user able to navigate from homepage to the appropriate page "SHOP BEDDING"
    And user go back
    And user able to see instagram bar
    Then User able to see "Shop the catalog" button
    And User able to see "Request a catalog" button




#  Use navigation from home page to go to carousel options
  Scenario: As User and Guest I want to use main navigation carousel with Categories in header
    Given user is on homepage
    And the main navigation with Categories in Header is displayed
    Then user able navigating to category page after clicking on "Accessories" from main navigation carousel with Categories



#  Navigate to subcategory page using main navigation carousel
  Scenario: As User and Guest I want to navigate to subcategory page using main navigation carousel
    Given user is on homepage
    And the main navigation with Categories in Header is displayed
    And user able navigating to category page after clicking on "Bath" from main navigation carousel with Categories
    And user select random subcategory from subcategory filter

#  Navigate to PDP page
  Scenario: As user I want to Navigate to PDP page
    Given user navigating to PDP by clicking random product image

#  Add item to cart
  Scenario: As user I want add product to cart
    Given user is on PDP page
    And user selects random item color
    And user selects random item size
    And user selects random item Qty
    And user clicks add to cart button



#  Use search term to see search results
  Scenario: User navigates to PDP from search results
    Given user is able to open search modal
    And user type "pajamas" in searching modal input
    And user see suggested search in search modal
    And user click on random suggested search line in search modal
    Then user is on search result page
    And user navigating to PDP by clicking random product image
    Then user is on PDP page
    And user is able to open search modal
    And user type "towels" in searching modal input
    And user clicks search button in search modal
    Then user is on search result page

  # Open cart page
  Scenario: User navigates to cart page
    Given user is on PDP page
    And user selects random item color
    And user selects random item size
    And user selects random item Qty
    And user clicks add to cart button
    And user clicks on "View cart" button
    Then user is on cart page
    Then user click on logo to navigate homepage
    And user press on cart icon in header
    Then user is on cart page

  # Start checkout
    Given user is on PDP page
    And user selects random item color
    And user selects random item size
    And user selects random item Qty
    And user clicks add to cart button
    And user clicks on "View cart" button
    Then user is on cart page
    And user click on "Checkout" button
    And user in checkout
    And user is able to see "checkout as a guest option"
    Then user click on logo to navigate homepage
    And user click on Hamburger menu icon in header
    And user click on Login in the top of hamburger menu
    Then user on Login page
    And user enter valid email and password
    And user press "Log in" button
    Then user press on cart icon in header
    Then user is on cart page
    And user click on "Checkout" button
    And user in checkout
    Then user in shipping step of checkout



  # User is able to visit "Shop Insta" page
  Given user on "Shop Insta" page
    And user press on random image from posts list
    Then user press on close icon
    And user appears on "Shop Insta" page
    Then user press on Add your photo link
    And user appears on upload content form
    Then user press on close icon
    And user appears on "Shop Insta" page
#
##
#
## Happy path flow:
stageCom
 Create account ============================================== Done
 Go to account and edit some field============================ Done
 Open hamburger menu and navigate to subcategory============== Done
 Apply filter to see filtered results========================= Done
 Click on logo to navigate homepage=========================== Done
 Check + button on homepage=================================== -
 Homepage contains expected content=========================== -
 Check email subscription===================================== Done
 Log out ===================================================== Done
 Log in ====================================================== Done
 Use navigation from home page to go to carousel options====== -
 Click on logo to navigate homepage=========================== Done
 Navigate to subcategory page using main navigation carousel== -
 Navigate to PDP page========================================= Done
 Add item to cart============================================= Done
 Navigate back to home page using breadcrumbs================= Done
 Use search term to see search results======================== Done
 Navigate to PDP from search results========================== Done
 Navigate to PDP from product suggestions===================== Done
 Add item to wishlist========================================= Done
 Go to account wish list====================================== Done
 Add item to cart from wish list============================== -
 Open cart page===============================================
 Start checkout=============================================== Done

====-

   Happy path flow:(DENIS) - отмечены те, что добавлены выше

   Open hamburger menu and navigate to subcategory ======================== Done
   User is able to reach Account page from hamburger menu ================= Done
   Navigate to PDP from "todaysDeals" page ================================
   Apply "Shop by Category" filter to see filtered results ================
   Apply filter to see filtered results =================================== Done
   Apply sort to see sorted results
   Click on logo to navigate homepage ===================================== Done
   Homepage contains expected content
   Navigate to PDP page =================================================== Done
   Navigate to PDP page from PLP top nav carousel
   Navigate to PDP from search results ==================================== Done
   Navigate to PDP from product suggestions =============================== Done
   Add item to cart ======================================================= Done
   Use search term to see search results
   Navigate to subcategory page from home page
   "No Results" Search page =============================================== Done
