<?php

declare(strict_types=1);

namespace App\Presenters;

use App\Model\PostFacade;
use Nette\Application\UI\Form;
use Nette;
use Nette\Schema\Expect;

final class HomepagePresenter extends Nette\Application\UI\Presenter
{
	private PostFacade $facade;


	public function __construct(PostFacade $facade)
	{
		$this->facade = $facade;
	}


	public function renderDefault(): void
	{
		$this->template->posts = $this->facade
			->getPublicArticles($this->getUser()->isLoggedIn());
	}

	/**
	* Delete button
	*/
	public function renderDeleteB(){
		$this->template->posts = $this->facade
			->getPublicArticles($this->getUser()->isLoggedIn());
	}

	/**
	 * function to delete article with all associated comments
	 * its called from n:href in default.latte (presenter)
	 */
	public function handleDelete(int $id){
		if(!$this->getUser()->isLoggedIn()){
			throw new \Exception('Musíte se přihlásit.');
		}
		
		try{
			$this->facade->delete_article($id);	
			$this->flashMessage('Povedlo se :)', 'success');
			//$this->redirect('this');
		
		}
		catch(\Exception $e){// tohle proste nechápu... proč se vyjmka vyvolá když je vše ok?
			$this->flashMessage('Něco se nepovedlo...'.$e->getMessage(), 'fail');
			//$this->redirect('this');
		}

		$this->redirect('this');

	}

}
